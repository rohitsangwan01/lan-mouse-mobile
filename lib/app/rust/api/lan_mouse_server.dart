// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.6.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// These functions are ignored because they are not marked as `pub`: `get_certificate`

Future<CancellationTokenWrapper> createCancellationToken() =>
    RustLib.instance.api.crateApiLanMouseServerCreateCancellationToken();

Future<(SenderWrapper, ReceiverWrapper)> createChannel() =>
    RustLib.instance.api.crateApiLanMouseServerCreateChannel();

Future<String?> getFingerprint({required String path}) =>
    RustLib.instance.api.crateApiLanMouseServerGetFingerprint(path: path);

Stream<Uint8List> connect(
        {required String basePath,
        required String ipAddSrt,
        required int port,
        required ReceiverWrapper rx,
        required CancellationTokenWrapper cancelToken}) =>
    RustLib.instance.api.crateApiLanMouseServerConnect(
        basePath: basePath,
        ipAddSrt: ipAddSrt,
        port: port,
        rx: rx,
        cancelToken: cancelToken);

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<CancellationTokenWrapper>>
abstract class CancellationTokenWrapper implements RustOpaqueInterface {
  Future<void> cancel();

  Future<bool> isCancelled();
}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<ReceiverWrapper>>
abstract class ReceiverWrapper implements RustOpaqueInterface {}

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<SenderWrapper>>
abstract class SenderWrapper implements RustOpaqueInterface {
  Future<void> send({required List<int> data});
}
