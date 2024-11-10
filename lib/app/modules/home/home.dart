import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/modules/home/widgets/home_connections.dart';

import 'package:lan_mouse_mobile/app/modules/home/widgets/home_general.dart';
import 'package:lan_mouse_mobile/app/modules/home/widgets/home_top.dart';
import 'package:lan_mouse_mobile/app/services/rust_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lan Mouse",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTop(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      RustService.instance.connect();
                    },
                    child: const Text("StartServer"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // String? fingerPrint =
                      //     await RustService.instance.getFingerprint();
                      // print("fingerprint $fingerPrint");
                      RustService.instance.test();
                    },
                    child: const Text("Fingerprint"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const HomeGeneral(),
              const SizedBox(height: 40),
              const HomeConnections(),
            ],
          ),
        ),
      ),
    );
  }
}
