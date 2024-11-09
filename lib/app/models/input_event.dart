// ignore_for_file: constant_identifier_names

import 'dart:typed_data';

import 'package:lan_mouse_mobile/app/models/event_type.dart';

const int _BTN_LEFT = 0x110;
const int _BTN_RIGHT = 0x111;
const int _BTN_MIDDLE = 0x112;
const int _BTN_BACK = 0x113;
const int _BTN_FORWARD = 0x114;

abstract class InputEvent {
  EventType get type;
  Uint8List get buffer;
}

enum ButtonType {
  Left,
  Right,
  Middle,
  Back,
  Forward;

  int get byte {
    return switch (this) {
      Left => _BTN_LEFT,
      Right => _BTN_RIGHT,
      Middle => _BTN_MIDDLE,
      Back => _BTN_BACK,
      Forward => _BTN_FORWARD,
    };
  }
}
