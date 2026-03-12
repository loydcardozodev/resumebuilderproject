import 'package:adminresume/config/app_config.dart';
import 'package:adminresume/firebase_options.dart';
import 'package:adminresume/main.dart';
import 'package:adminresume/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

Future<void> bootstrap(AppConfig config) async {
  Logger.root.level = config.logLevel;
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '[${record.level.name}] ${record.loggerName}: ${record.message}',
    );
  });

  WidgetsFlutterBinding.ensureInitialized();

  if (config.flavor == AppFlavor.firebase) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiProvider(
      providers: buildProviders(config),
      child: MainApp(config: config),
    ),
  );
}
