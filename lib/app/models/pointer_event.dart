import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:lan_mouse_mobile/app/models/event_type.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';

class MotionEvent extends InputEvent {
  final int time = 0;
  final double dx;
  final double dy;

  MotionEvent({required this.dx, required this.dy});

  @override
  EventType get type => EventType.PointerMotion;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt32(time);
    writer.writeFloat64(dx);
    writer.writeFloat64(dy);
    return writer.toBytes();
  }
}

class ButtonEvent extends InputEvent {
  final int time = 0;
  late final int button;
  late final int state;

  ButtonEvent({required ButtonType button, required bool down}) {
    state = down ? 1 : 0;
    this.button = button.byte;
  }

  @override
  EventType get type => EventType.PointerButton;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt32(time);
    writer.writeInt32(button);
    writer.writeInt32(state);
    return writer.toBytes();
  }
}

class AxisEvent extends InputEvent {
  final int time = 0;
  late final int axis;
  final double value;

  AxisEvent({required bool vertical, required this.value}) {
    axis = vertical ? 0 : 1;
  }

  @override
  EventType get type => EventType.PointerAxis;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt32(time);
    writer.writeInt8(axis);
    writer.writeFloat64(value);
    return writer.toBytes();
  }
}

class AxisDiscrete120Event extends InputEvent {
  final int axis;
  final int value;

  AxisDiscrete120Event({required this.axis, required this.value});

  @override
  EventType get type => EventType.PointerAxisValue120;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt8(axis);
    writer.writeInt32(value);
    return writer.toBytes();
  }
}
