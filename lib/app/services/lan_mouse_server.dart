import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/models/client.dart';
import 'package:lan_mouse_mobile/app/models/event_type.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';

class LanMouseServer {
  LanMouseServer._privateConstructor();
  static final LanMouseServer instance = LanMouseServer._privateConstructor();

  String host = '0.0.0.0';
  int port = 4242;
  ValueNotifier<bool> isSocketRunning = ValueNotifier<bool>(false);

  RawDatagramSocket? _udpSocket;
  StreamSubscription? _socketStreamSubscription;
  Client? _activeClient;
  Completer<void>? _activeClientPingCompleter;
  Completer<void>? _activeClientAckCompleter;

  Future<void> startServer({
    bool ignoreIfAlreadyRunning = false,
  }) async {
    if (ignoreIfAlreadyRunning && isSocketRunning.value) return;

    stopServer();
    _udpSocket = await RawDatagramSocket.bind(host, port);
    isSocketRunning.value = true;

    _socketStreamSubscription = _udpSocket?.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Uint8List? data = _udpSocket?.receive()?.data;
        if (data == null) return;
        var eventType = EventType.fromEvent(data.first);
        print("Client: EventType: ${eventType.name}, $data");
        if (eventType == EventType.Ping) {
          _sendEventToActiveClient(EventType.Pong);
        } else if (eventType == EventType.Pong) {
          if (_activeClientPingCompleter?.isCompleted == false) {
            _activeClientPingCompleter?.complete();
          }
        } else if (eventType == EventType.Ack) {
          if (_activeClientAckCompleter?.isCompleted == false) {
            _activeClientAckCompleter?.complete();
          }
        }
      }
    });

    await Future.delayed(const Duration(milliseconds: 500));
  }

  void stopServer() {
    _udpSocket?.close();
    _socketStreamSubscription?.cancel();
    _udpSocket = null;
    isSocketRunning.value = false;
  }

  Future<bool> enterClient({
    required Client client,
    Duration timeout = const Duration(seconds: 4),
  }) async {
    try {
      _activeClient = client;

      _activeClientPingCompleter = Completer();
      _sendEventToActiveClient(EventType.Ping);

      print("Waiting for Pong From Client");
      await _activeClientPingCompleter?.future.timeout(timeout);
      _activeClientPingCompleter = null;
      print("Got Pong From Client");

      _activeClientAckCompleter = Completer();
      _sendEventToActiveClient(EventType.Enter, data: EventType.serial(1));

      print("Waiting for Ack From Client");
      await _activeClientPingCompleter?.future.timeout(timeout);
      _activeClientAckCompleter = null;
      print("Got Ack From Client");
      return true;
    } catch (e) {
      print("EnterClient Error: $e");
      return false;
    }
  }

  void leaveClient() {
    _sendEventToActiveClient(EventType.Leave, data: EventType.serial(1));
    _activeClient = null;
    _activeClientPingCompleter = null;
    _activeClientAckCompleter = null;
  }

  void sendInputEvent(InputEvent inputEvent) {
    _sendEventToActiveClient(
      inputEvent.type,
      data: inputEvent.buffer,
    );
  }

  /// Send events to active client
  int? _sendEventToActiveClient(
    EventType type, {
    List<int> data = const [],
  }) {
    if (_activeClient == null) {
      print("No active client");
      return null;
    }
    return _udpSocket?.send(
      [type.index, ...data],
      InternetAddress(_activeClient!.host),
      _activeClient!.port,
    );
  }
}
