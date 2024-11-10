import 'dart:io';

import 'package:lan_mouse_mobile/app/rust/api/lan_mouse_server.dart' as rust;
import 'package:path_provider/path_provider.dart';

class RustService {
  RustService._privateConstructor();
  static final RustService instance = RustService._privateConstructor();
  String? _tempPath;

  Future<String> get tempPath async {
    if (_tempPath == null) {
      final Directory tempDir = await getTemporaryDirectory();
      _tempPath = tempDir.path;
    }
    return _tempPath!;
  }

  Future<void> connect() async {
    rust.connect(
      basePath: await tempPath,
      ipAddSrt: '192.168.1.42',
      port: 4242,
      // targetAddr: '192.168.1.49',
      // targetPort: "4242",
    );
  }

  Future<String?> getFingerprint() async =>
      rust.getFingerprint(path: await tempPath);
}
