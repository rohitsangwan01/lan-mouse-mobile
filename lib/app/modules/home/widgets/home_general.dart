import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lan_mouse_mobile/app/services/lan_mouse_server.dart';
import 'package:network_info_plus/network_info_plus.dart';

class HomeGeneral extends StatefulWidget {
  const HomeGeneral({super.key});

  @override
  State<HomeGeneral> createState() => _HomeGeneralState();
}

class _HomeGeneralState extends State<HomeGeneral> {
  LanMouseServer lanMouseServer = LanMouseServer.instance;
  String fingerprint = "";

  var portController = TextEditingController();
  var hostnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    portController.text = 4242.toString();
    _refreshData();
  }

  void _refreshData() async {
    // Load Ip
    try {
      NetworkInfo network = NetworkInfo();
      hostnameController.text = (await network.getWifiIP()) ?? "127.0.0.1";
    } catch (e) {
      showSnackbar("NetworkInfoError: $e");
    }
    // Load FingerPrint
    try {
      String? data = await lanMouseServer.getFingerprint();
      if (data != null) {
        setState(() {
          fingerprint = data;
        });
      } else {
        showSnackbar("Failed to get fingerprint");
      }
    } catch (e) {
      showSnackbar("Failed to get fingerprint: $e");
    }
  }

  void showSnackbar(message) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "General",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            IconButton(
              onPressed: _refreshData,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text("port"),
                    Expanded(
                      child: TextFormField(
                        controller: portController,
                        maxLength: 4,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: const InputDecoration(
                          hintText: "Port",
                          border: InputBorder.none,
                          counterText: "",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    const Text("hostname"),
                    Expanded(
                      child: TextFormField(
                        controller: hostnameController,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Host",
                          counterText: "",
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    InkWell(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(text: hostnameController.text),
                        );
                      },
                      child: const Icon(Icons.copy),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.fingerprint),
                  title: const Text("Certificate Fingerprint"),
                  subtitle: Text(
                    fingerprint,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: fingerprint));
                    showSnackbar("Fingerprint copied to clipboard");
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }
}
