import 'package:flutter/material.dart';
import 'package:resumerbuilder/config/app_config.dart';
import 'package:resumerbuilder/routing/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.config});

  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Resume Builder',
      debugShowCheckedModeBanner: config.isDevelopment,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
