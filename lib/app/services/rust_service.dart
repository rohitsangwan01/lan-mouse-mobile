import 'dart:io';
import 'dart:typed_data';

import 'package:lan_mouse_mobile/app/rust/api/lan_mouse_server.dart' as rust;

import 'package:path_provider/path_provider.dart';

class RustService {
  RustService._privateConstructor();
  static final RustService instance = RustService._privateConstructor();
  String? _tempPath;
  rust.SenderWrapper? _sender;

  Future<String> get tempPath async {
    if (_tempPath == null) {
      final Directory tempDir = await getTemporaryDirectory();
      _tempPath = tempDir.path;
    }
    return _tempPath!;
  }

  Future<void> connect() async {
    var (sender, receiver) = await rust.createChannel();
    _sender = sender;

    Stream<Uint8List> stream = rust.connect(
      basePath: await tempPath,
      ipAddSrt: '192.168.1.49',
      port: 4242,
      rx: receiver,
    );

    stream.listen((data) {
      print("From Rust: $data");
      sender.send(data: data);
    }).onDone(() {
      print("Done");
    });
  }

  void test() {
    _sender?.send(data: [1, 2, 3, 4]);
  }

  Future<String?> getFingerprint() async =>
      rust.getFingerprint(path: await tempPath);
}
