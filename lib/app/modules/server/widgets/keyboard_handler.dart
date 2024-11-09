import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';
// import 'package:lan_mouse_mobile/app/models/keyboard_event.dart' as ke;

class KeyboardHandler extends StatefulWidget {
  const KeyboardHandler({super.key});

  @override
  State<KeyboardHandler> createState() => _KeyboardHandlerState();
}

class _KeyboardHandlerState extends State<KeyboardHandler> {
  final LanMouseServer lanMouseServer = LanMouseServer.instance;

  void onKeyPress(VirtualKeyboardKey key) async {
    print("Key pressed: ${key.text} ${key.capsText} ${key.action}");
    // TODO: Convert to keycode & Fix KeyEvent
    // int keyCode = 16;
    // lanMouseServer.sendInputEvent(
    //   ke.KeyEvent(key: keyCode, down: true),
    // );
    // await Future.delayed(const Duration(milliseconds: 500));
    // lanMouseServer.sendInputEvent(
    //   ke.KeyEvent(key: keyCode, down: false),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: VirtualKeyboard(
        defaultLayouts: const [VirtualKeyboardDefaultLayouts.English],
        type: VirtualKeyboardType.Alphanumeric,
        onKeyPress: onKeyPress,
      ),
    );
  }
}
