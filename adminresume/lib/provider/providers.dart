import 'package:adminresume/config/app_config.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> buildProviders(AppConfig config) {
  return config.useFirebase ? firebaseProviders : localProviders;
}

List<SingleChildWidget> firebaseProviders = [];

List<SingleChildWidget> localProviders = [];
