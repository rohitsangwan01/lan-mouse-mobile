import 'dart:typed_data';

import 'package:buffer/buffer.dart';
import 'package:lan_mouse_mobile/app/models/event_type.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';

class KeyEvent extends InputEvent {
  final int time = 0;
  final int key;
  late final int state;

  KeyEvent({required this.key, required bool down}) {
    state = down ? 1 : 0;
  }

  @override
  EventType get type => EventType.KeyboardKey;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt32(time);
    writer.writeInt32(key);
    writer.writeInt8(state);
    return writer.toBytes();
  }
}

class ModifiersEvent extends InputEvent {
  final int depressed;
  final int latched;
  final int locked;
  final int group;

  ModifiersEvent({
    required this.depressed,
    required this.latched,
    required this.locked,
    required this.group,
  });

  @override
  EventType get type => EventType.KeyboardModifiers;

  @override
  Uint8List get buffer {
    final writer = ByteDataWriter();
    writer.writeInt32(depressed);
    writer.writeInt32(latched);
    writer.writeInt32(locked);
    writer.writeInt32(group);
    return writer.toBytes();
  }
}
