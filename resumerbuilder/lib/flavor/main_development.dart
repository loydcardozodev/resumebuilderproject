import 'package:resumerbuilder/config/app_config.dart';
import 'package:resumerbuilder/config/bootstrap.dart';

void main() async {
  await bootstrap(AppConfig.development);
}
