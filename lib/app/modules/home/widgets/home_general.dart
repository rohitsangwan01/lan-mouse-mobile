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

  var portController = TextEditingController();
  var hostnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadIp();
  }

  void loadIp() async {
    hostnameController.text = lanMouseServer.host;
    portController.text = lanMouseServer.port.toString();
    try {
      NetworkInfo network = NetworkInfo();
      hostnameController.text = (await network.getWifiIP()) ?? "127.0.0.1";
    } catch (e) {
      print("NetworkInfoError: $e");
    }
    _syncHostAndPort();
  }

  void toggleServer(bool isRunning) {
    _syncHostAndPort();
    if (!isRunning) {
      lanMouseServer.startServer();
    } else {
      lanMouseServer.stopServer();
    }
  }

  void _syncHostAndPort() {
    lanMouseServer.host = hostnameController.text;
    lanMouseServer.port = int.parse(portController.text);
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
            ValueListenableBuilder<bool>(
              valueListenable: lanMouseServer.isSocketRunning,
              builder: (context, isRunning, _) {
                return IconButton(
                  onPressed: () => toggleServer(isRunning),
                  icon: Icon(
                    Icons.lan,
                    color: isRunning ? Colors.green : null,
                  ),
                );
              },
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
                      onTap: loadIp,
                      child: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
