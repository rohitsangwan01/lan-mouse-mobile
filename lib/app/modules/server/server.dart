import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/models/client.dart';
import 'package:lan_mouse_mobile/app/modules/server/widgets/keyboard_handler.dart';
import 'package:lan_mouse_mobile/app/modules/server/widgets/mouse_buttons.dart';
import 'package:lan_mouse_mobile/app/modules/server/widgets/mouse_pad.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';

class Server extends StatefulWidget {
  final Client client;

  const Server({super.key, required this.client});

  @override
  State<Server> createState() => _ServerState();
}

class _ServerState extends State<Server> {
  LanMouseServer lanMouseServer = LanMouseServer.instance;
  bool waitingForAck = false;
  bool showKeyboard = false;

  @override
  void initState() {
    super.initState();
    enterClient();
  }

  void enterClient() async {
    setState(() {
      waitingForAck = true;
    });
    await lanMouseServer.enterClient(
      client: widget.client,
      onError: (String err) {
        _showErrorDialog(err);
      },
    );
    setState(() {
      waitingForAck = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    lanMouseServer.leaveClient();
  }

  void _showErrorDialog(String error) {
    if (!context.mounted) return;
    showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog.adaptive(
          title: const Text("Error"),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            )
          ],
        );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lan Mouse Server"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Text(widget.client.toString()),
        ),
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showKeyboard = !showKeyboard;
              });
            },
            icon: const Icon(Icons.keyboard),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: MousePad(),
                ),
                Center(
                  child: Visibility(
                    visible: waitingForAck,
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: MouseButtons(),
          ),
          const SizedBox(height: 20),
          if (showKeyboard) const KeyboardHandler(),
        ],
      ),
    );
  }
}
