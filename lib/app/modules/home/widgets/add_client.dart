import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lan_mouse_mobile/app/models/client.dart';

class AddClient extends StatefulWidget {
  final Function(Client client) onAdd;
  const AddClient({super.key, required this.onAdd});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  var hostController = TextEditingController();
  var portController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void _onAddTap() {
    if (!formKey.currentState!.validate()) return;
    String host = hostController.text;
    int port = int.parse(portController.text);
    print("Host: $host, Port: $port");
    Navigator.pop(context);
    widget.onAdd(Client(host: host, port: port));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text("Add Client"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: hostController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid host';
                }
                // Ensure valid address
                try {
                  InternetAddress(value);
                } catch (e) {
                  return "Please enter valid host";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Host",
              ),
            ),
            TextFormField(
              controller: portController,
              maxLength: 4,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.length != 4) {
                  return 'Please enter valid port';
                }
                return null;
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: "Port",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: _onAddTap,
          child: const Text("Add"),
        ),
      ],
    );
  }
}
