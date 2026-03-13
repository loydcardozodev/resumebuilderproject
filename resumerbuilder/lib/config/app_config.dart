import 'package:logging/logging.dart';

enum AppFlavor { firebase, development }

class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.apiBaseUrl,
    required this.logLevel,
  });

  final AppFlavor flavor;
  final String apiBaseUrl;
  final Level logLevel;

  bool get isDevelopment => flavor == AppFlavor.development;
  bool get useFirebase => flavor == AppFlavor.firebase;

  static const firebase = AppConfig(
    flavor: AppFlavor.firebase,
    apiBaseUrl: 'https://resumerbuilder-ad4cd.firebaseapp.com',
    logLevel: Level.INFO,
  );

  static const development = AppConfig(
    flavor: AppFlavor.development,
    apiBaseUrl: 'local',
    logLevel: Level.ALL,
  );
}
