import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'package:resumerbuilder/config/app_config.dart';
import 'package:resumerbuilder/firebase_options.dart';
import 'package:resumerbuilder/main.dart';
import 'package:resumerbuilder/providers/providers.dart';

Future<void> bootstrap(AppConfig config) async {
  // Setup logging
  Logger.root.level = config.logLevel;
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '[${record.level.name}] ${record.loggerName}: ${record.message}',
    );
  });

  WidgetsFlutterBinding.ensureInitialized();

  // Only init Firebase in firebase flavor
  if (config.useFirebase) {
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
