import 'package:provider/single_child_widget.dart';
import 'package:resumerbuilder/config/app_config.dart';

List<SingleChildWidget> buildProviders(AppConfig config) {
  return config.useFirebase ? firebaseProviders : localProviders;
}

List<SingleChildWidget> firebaseProviders = [];

List<SingleChildWidget> localProviders = [];
