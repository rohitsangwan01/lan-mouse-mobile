import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/models/input_event.dart';
import 'package:lan_mouse_mobile/app/models/pointer_event.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';

class MousePad extends StatefulWidget {
  const MousePad({super.key});

  @override
  State<MousePad> createState() => _MousePadState();
}

class _MousePadState extends State<MousePad> {
  final LanMouseServer lanMouseServer = LanMouseServer.instance;
  final Set<int> _activePointers = {};

  final double _tapThreshold = 10.0;
  final int _tapTimeThreshold = 200;
  double _mouseSensitivity = 2.0;

  Offset _position = const Offset(150, 150);
  Offset _lastPosition = Offset.zero;
  Offset _downPosition = Offset.zero;

  int? _downTime;

  void onTap() async {
    lanMouseServer.sendInputEvent(
      ButtonEvent(button: ButtonType.Left, down: true),
    );
    await Future.delayed(const Duration(milliseconds: 40));
    lanMouseServer.sendInputEvent(
      ButtonEvent(button: ButtonType.Left, down: false),
    );
  }

  void onMove(double dx, double dy) {
    lanMouseServer.sendInputEvent(MotionEvent(dx: dx, dy: dy));
  }

  void onScroll(double dx, double dy) {
    // Handle horizontal axis as well
    lanMouseServer.sendInputEvent(
      AxisEvent(vertical: true, value: dy),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) {
        final dx = (event.position.dx - _lastPosition.dx) * _mouseSensitivity;
        final dy = (event.position.dy - _lastPosition.dy) * _mouseSensitivity;
        _position = Offset(_position.dx + dx, _position.dy + dy);
        _lastPosition = event.position;
        if (_activePointers.length == 1) {
          onMove(dx, dy);
        } else {
          onScroll(dx, dy);
        }
      },
      onPointerDown: (PointerDownEvent event) {
        _activePointers.add(event.pointer);
        _lastPosition = event.position;
        _downPosition = event.position;
        _downTime = DateTime.now().millisecondsSinceEpoch;
      },
      onPointerUp: (PointerUpEvent event) {
        final upTime = DateTime.now().millisecondsSinceEpoch;
        final timeDiff = upTime - (_downTime ?? 0);
        final distance = (event.position - _downPosition).distance;
        if (timeDiff <= _tapTimeThreshold && distance <= _tapThreshold) {
          onTap();
        }
        _activePointers.remove(event.pointer);
      },
      onPointerCancel: (PointerCancelEvent event) {
        _activePointers.remove(event.pointer);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                Card(
                  color: Colors.black.withAlpha(2),
                  child: InkWell(
                    onTap: () {
                      if (_mouseSensitivity == 1) return;
                      setState(() {
                        // Keep positive
                        _mouseSensitivity = _mouseSensitivity - 1;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.remove),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("x$_mouseSensitivity "),
                    Text(
                      "Sensitivity",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Card(
                  color: Colors.black.withAlpha(2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _mouseSensitivity = _mouseSensitivity + 1;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
