import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:lan_mouse_mobile/app/models/client.dart';
import 'package:lan_mouse_mobile/app/models/event_type.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';
import 'package:lan_mouse_mobile/app/rust/api/lan_mouse_server.dart' as rust;
import 'package:path_provider/path_provider.dart';

class LanMouseServer {
  LanMouseServer._privateConstructor();
  static final LanMouseServer instance = LanMouseServer._privateConstructor();

  String? _tempPath;
  rust.SenderWrapper? _sender;
  StreamSubscription? _streamSubscription;

  Future<String> get _basePath async {
    if (_tempPath == null) {
      final Directory tempDir = await getTemporaryDirectory();
      _tempPath = tempDir.path;
    }
    return _tempPath!;
  }

  Future<String?> getFingerprint() async =>
      rust.getFingerprint(path: await _basePath);

  Future<void> enterClient({
    required Client client,
    required Function(String) onError,
  }) async {
    var (sender, receiver) = await rust.createChannel();
    _sender = sender;

    Stream<Uint8List> stream = rust.connect(
      basePath: await _basePath,
      ipAddSrt: client.host,
      port: client.port,
      rx: receiver,
    );

    _streamSubscription = stream.listen((data) {
      var eventType = EventType.fromEvent(data.first);
      print("Client: EventType: ${eventType.name}, $data");
      if (eventType == EventType.Ping) {
        _sendEventToActiveClient(EventType.Pong);
      }
    }, onError: (err) => onError(err.toString()));
  }

  void leaveClient() {
    // Send empty data to close all
    _sender?.send(data: []);
    _streamSubscription?.cancel();
    _sender = null;
  }

  void sendInputEvent(InputEvent inputEvent) {
    _sendEventToActiveClient(
      inputEvent.type,
      data: inputEvent.buffer,
    );
  }

  /// Send events to active client
  void _sendEventToActiveClient(
    EventType type, {
    List<int> data = const [],
  }) {
    _sender?.send(data: [type.index, ...data]);
  }
}
