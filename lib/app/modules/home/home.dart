import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/modules/home/widgets/home_connections.dart';

import 'package:lan_mouse_mobile/app/modules/home/widgets/home_general.dart';
import 'package:lan_mouse_mobile/app/modules/home/widgets/home_top.dart';

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
      body: const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTop(),
              SizedBox(height: 40),
              HomeGeneral(),
              SizedBox(height: 40),
              HomeConnections(),
            ],
          ),
        ),
      ),
    );
  }
}
