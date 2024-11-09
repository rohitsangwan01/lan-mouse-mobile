// ignore_for_file: constant_identifier_names

import 'package:buffer/buffer.dart';

enum EventType {
  PointerMotion,
  PointerButton,
  PointerAxis,
  PointerAxisValue120,
  KeyboardKey,
  KeyboardModifiers,
  Ping,
  Pong,
  Enter,
  Leave,
  Ack;

  factory EventType.fromEvent(int event) {
    return EventType.values[event];
  }

  static List<int> serial(int serial) {
    final writer = ByteDataWriter();
    writer.writeInt32(serial);
    return writer.toBytes();
  }
}
