use crate::api::crypto;
use crate::frb_generated::StreamSink;
use std::sync::Arc;
use std::{
    net::{IpAddr, SocketAddr},
    path::PathBuf,
    str::FromStr,
};
use tokio::net::UdpSocket;
pub use tokio::sync::mpsc::{channel, Receiver, Sender};
use webrtc_dtls::crypto::Certificate;
use webrtc_dtls::{
    config::{Config, ExtendedMasterSecretType},
    conn::DTLSConn,
};
use webrtc_util::Conn;

// From lan_mouse_proto::MAX_EVENT_SIZE;
pub const MAX_EVENT_SIZE: usize = size_of::<u8>() + size_of::<u32>() + 2 * size_of::<f64>();

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

/// Channel Wrappers
pub struct ReceiverWrapper(Receiver<Vec<u8>>);
pub struct SenderWrapper(Sender<Vec<u8>>);
impl SenderWrapper {
    pub async fn send(&self, data: Vec<u8>) {
        if let Err(err) = self.0.send(data).await {
            log::error!("Failed to send event {err}");
        }
    }
}
pub fn create_channel() -> (SenderWrapper, ReceiverWrapper) {
    let channel = channel::<Vec<u8>>(256);
    (SenderWrapper(channel.0), ReceiverWrapper(channel.1))
}

/// Start a UdbSocket and create connection with given Client
pub async fn connect(
    base_path: String,
    ip_addr: &str,
    port: u16,
    target_addr: &str,
    target_port: u16,
    rx: ReceiverWrapper,
    sink: StreamSink<Vec<u8>>,
) {
    let cert = get_certificate(base_path).unwrap();

    let socket = format!("{ip_addr}:{port}");
    log::info!("Binding to {socket}");
    let udp_conn = Arc::new(UdpSocket::bind("0.0.0.0:0").await.unwrap());

    let target_socket = SocketAddr::new(IpAddr::from_str(target_addr).unwrap(), target_port);
    if let Err(err) = udp_conn.connect(target_socket).await {
        log::info!("Faild to connect {err}");
        let _ = sink.add_error(err.to_string());
        return;
    }
    log::info!("Connected to Udp");
    let config = Config {
        certificates: vec![cert],
        server_name: "ignored".to_owned(),
        insecure_skip_verify: true,
        extended_master_secret: ExtendedMasterSecretType::Require,
        ..Default::default()
    };

    let dtls = match DTLSConn::new(udp_conn, config, true, None).await {
        Ok(conn) => conn,
        Err(err) => {
            log::info!("Failed to generate DtlsConnection: {err}");
            let _ = sink.add_error(err.to_string());
            return;
        }
    };

    let mut receiver = rx.0;
    let mut buf = [0u8; MAX_EVENT_SIZE];

    log::info!("Starting loop");
    loop {
        tokio::select! {
            // Listen for incoming DTLS messages
            result = dtls.recv(&mut buf) => {
                match result {
                    Ok(_) => {
                        // Send the received data back to Dart
                        let _  = sink.add(buf.to_vec());
                    }
                    Err(e) => {
                        log::info!("Error receiving from DTLS: `{e}`, closing connection");
                        let _ = sink.add_error(e.to_string());
                        let _ = dtls.close().await;
                        break;
                    }
                }
            }
            // Listen for incoming data from Dart
            Some(data) = receiver.recv() => {
                // Check if cancel message
                if data.len() == 0 {
                    log::error!("Closing channels");
                    let _ = dtls.close().await;
                    break;
                }

                if let Err(e) = dtls.send(&data).await {
                    log::error!("Error sending to DTLS: `{e}`, closing connection");
                    let _ = sink.add_error(e.to_string());
                    let _ = dtls.close().await;
                    break;
                }
            },
        }
    }
    log::info!("Closing connection");
}

pub fn get_fingerprint(path: String) -> Option<String> {
    let cert = get_certificate(path);
    if cert.is_none() {
        return None;
    }
    let fingerprint = crypto::certificate_fingerprint(&cert.unwrap());
    return Some(fingerprint);
}

fn get_certificate(path: String) -> Option<Certificate> {
    let cert_path = PathBuf::from(path).join("lan-mouse.pem");
    match crypto::load_or_generate_key_and_cert(&cert_path) {
        Ok(c) => {
            return Some(c);
        }
        Err(err) => {
            println!("Failed to generate cert: {:?}", err);
            return None;
        }
    };
}
