import 'package:flutter/material.dart';
import 'package:lan_mouse_mobile/app/modules/home/home.dart';
import 'package:lan_mouse_mobile/app/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.instance.init();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff282424),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff282424),
        ),
        cardTheme: const CardTheme(
          color: Color(0xff363636),
        ),
      ),
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color(0xfffafafa),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfffafafa),
        ),
        cardTheme: const CardTheme(
          color: Color(0xffffffff),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    ),
  );
}
