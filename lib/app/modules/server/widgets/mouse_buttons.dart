import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';
import 'package:lan_mouse_mobile/app/models/pointer_event.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';

class MouseButtons extends StatelessWidget {
  const MouseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            MouseButton(
              icon: Icons.arrow_left,
              buttonType: ButtonType.Left,
            ),
            SizedBox(width: 10),
            MouseButton(
              icon: Icons.arrow_right,
              buttonType: ButtonType.Right,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            MouseButton(
              icon: Icons.skip_previous,
              buttonType: ButtonType.Back,
            ),
            SizedBox(width: 10),
            MouseButton(
              icon: Icons.unfold_more,
              buttonType: ButtonType.Middle,
            ),
            SizedBox(width: 10),
            MouseButton(
              icon: Icons.skip_next,
              buttonType: ButtonType.Forward,
            ),
          ],
        ),
      ],
    );
  }
}

class MouseButton extends StatelessWidget {
  final IconData icon;
  final ButtonType buttonType;

  const MouseButton({
    super.key,
    required this.icon,
    required this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    final LanMouseServer server = LanMouseServer.instance;
    return Expanded(
      child: InkWell(
        onTapDown: (_) {
          server.sendInputEvent(ButtonEvent(button: buttonType, down: true));
        },
        onTapUp: (_) {
          server.sendInputEvent(ButtonEvent(button: buttonType, down: false));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
