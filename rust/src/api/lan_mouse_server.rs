use crate::api::client;
use crate::api::connect::LanMouseConnection;
use crate::api::crypto;
use lan_mouse_ipc::ClientConfig;
use lan_mouse_ipc::ClientHandle;
use lan_mouse_ipc::ClientState;
use lan_mouse_proto::ProtoEvent;
use lan_mouse_proto::MAX_EVENT_SIZE;
use std::sync::Arc;
use std::{
    net::{IpAddr, SocketAddr},
    path::PathBuf,
    str::FromStr,
};
use tokio::net::UdpSocket;
use tokio::task::LocalSet;
use webrtc_dtls::crypto::Certificate;
use webrtc_dtls::{
    config::{Config, ExtendedMasterSecretType},
    conn::DTLSConn,
};
use webrtc_util::Conn;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
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

pub async fn connect(base_path: String, ip_add_srt: &str, port: u16) {
    let cert = get_certificate(base_path).unwrap();

    let addr = SocketAddr::new(IpAddr::from_str(ip_add_srt).unwrap(), port);
    let conn = Arc::new(UdpSocket::bind("0.0.0.0:0").await.unwrap());
    log::info!("connecting to {addr} ...");

    let target_socket = SocketAddr::new(IpAddr::from_str("192.168.1.49").unwrap(), port);
    if let Err(err) = conn.connect(target_socket).await {
        log::info!("Faild to connect {err}");
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
    let dtls: DTLSConn = match DTLSConn::new(conn, config, true, None).await {
        Ok(conn) => conn,
        Err(err) => {
            log::info!("Failed to generate DtlsConnection {err}");
            return;
        }
    };
    log::info!("DtlsConn ready, Sending Ping");
    let (buf, len) = ProtoEvent::Ping.into();
    if let Err(e) = dtls.send(&buf[..len]).await {
        log::info!("{addr}: send error `{e}`, closing connection");
        let _ = dtls.close().await;
    }

    log::info!("Ping Sent");
    let mut buf = [0u8; MAX_EVENT_SIZE];
    while dtls.recv(&mut buf).await.is_ok() {
        if let Ok(event) = buf.try_into() {
            log::info!("{addr} <==<==<== {event}");
            match event {
                ProtoEvent::Pong(b) => {
                    log::info!("PONG <->->->->- {addr} {b}");
                }
                _ => {
                    log::info!("Event {event:?}")
                }
            }
        }
    }
}

// pub async fn connect(base_path: String, ip_add_srt: &str, port: u16) {
//     let runtime = tokio::runtime::Builder::new_current_thread()
//         .enable_io()
//         .enable_time()
//         .build()
//         .unwrap();
//     runtime.block_on(LocalSet::new().run_until(run_connection(base_path)));
// }

// async fn run_connection(base_path: String) {
//     let config_path = PathBuf::from(base_path);
//     let cert_path = config_path.join("lan-mouse.pem");
//     println!("{:?}", cert_path);

//     let cert = match crypto::load_or_generate_key_and_cert(&cert_path) {
//         Ok(c) => c,
//         Err(err) => {
//             println!("Failed to generate cert: {:?}", err);
//             return;
//         }
//     };
//     let fingerprint = crypto::certificate_fingerprint(&cert);
//     println!("Certificate fingerprint: {fingerprint}");

//     let client_manager = client::ClientManager::default();

//     let handle = add_client(&client_manager, "192.168.1.49", 4242);

//     let mut connection: LanMouseConnection = LanMouseConnection::new(cert, client_manager.clone());

//     if let Err(err) = connection.send(ProtoEvent::Ping, handle).await {
//         println!("Failed to send ping: {:?}", err);
//         // return;
//     }
//     if let Err(err) = connection.send(ProtoEvent::Ping, handle).await {
//         println!("Failed to send ping: {:?}", err);
//         // return;
//     }

//     loop {
//         let (handle, event) = connection.recv().await;
//         println!("Event from {handle} {event}")
//     }
// }

// fn add_client(client_manager: &client::ClientManager, ip_add_srt: &str, port: u16) -> ClientHandle {
//     let handle = client_manager.add_client();
//     let ip_address = match IpAddr::from_str(ip_add_srt) {
//         Ok(address) => address,
//         Err(err) => {
//             println!("Failed to parse IP address: {:?}", err);
//             return handle;
//         }
//     };
//     client_manager.set_config(
//         handle,
//         ClientConfig {
//             hostname: Some(ip_add_srt.to_string()),
//             port,
//             fix_ips: vec![ip_address],
//             ..Default::default()
//         },
//     );
//     let socket_add = SocketAddr::new(ip_address, port);
//     client_manager.set_active_addr(handle, Some(socket_add));

//     client_manager.set_state(
//         handle,
//         ClientState {
//             active: true,
//             active_addr: Some(socket_add),
//             alive: true,
//             ips: vec![ip_address].into_iter().collect(),
//             ..Default::default()
//         },
//     );

//     client_manager.activate_client(handle);
//     handle
// }
