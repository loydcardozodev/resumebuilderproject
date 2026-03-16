import 'package:adminresume/config/app_config.dart';
import 'package:adminresume/data/repository/auth/firebase_auth_repository.dart';
import 'package:adminresume/data/repository/auth/local_auth_repository.dart';
import 'package:adminresume/data/repository/template_repository/firebase_template_repository.dart';
import 'package:adminresume/data/repository/template_repository/local_template_repository.dart';
import 'package:adminresume/data/repository/user/firebase_user_repository.dart';
import 'package:adminresume/data/repository/user/local_user_repository.dart';
import 'package:adminresume/data/services/firebase/firebase_auth_service.dart';
import 'package:adminresume/data/services/firebase/firebase_template_service.dart';
import 'package:adminresume/data/services/firebase/firebase_user_service.dart';
import 'package:adminresume/data/services/local/local_auth_service.dart';
import 'package:adminresume/data/services/local/local_template_service.dart';
import 'package:adminresume/data/services/local/local_user_service.dart';
import 'package:adminresume/ui/dashboard/viewmodel/dashboard_viewmodel.dart';
import 'package:adminresume/ui/template/viewmodel/template_viewmodel.dart';
import 'package:adminresume/ui/user/viewmodel/user_viewmodel.dart';
import 'package:adminresume/ui/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> buildProviders(AppConfig config) {
  return config.useFirebase ? _firebaseProviders() : _localProviders();
}

List<SingleChildWidget> _firebaseProviders() {
  final authService = FirebaseAdminAuthService();
  final templateService = FirebaseTemplateService();
  final userService = FirebaseUserService();

  final authRepo = FirebaseAdminAuthRepository(service: authService);
  final templateRepo = FirebaseAdminTemplateRepository(
    service: templateService,
  );
  final userRepo = FirebaseUserRepository(service: userService);

  return [
    ChangeNotifierProvider<AdminAuthViewModel>(
      create: (_) => AdminAuthViewModel(authRepo),
    ),
    ChangeNotifierProvider<DashboardViewModel>(
      create: (_) => DashboardViewModel(userRepo),
    ),
    ChangeNotifierProvider<AdminTemplateViewModel>(
      create: (_) => AdminTemplateViewModel(templateRepo),
    ),
    ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel(userRepo),
    ),
  ];
}

List<SingleChildWidget> _localProviders() {
  final authService = LocalAdminAuthService.instance;
  final templateService = LocalTemplateService.instance;
  final userService = LocalUserService.instance;

  final authRepo = LocalAdminAuthRepository(service: authService);
  final templateRepo = LocalAdminTemplateRepository(service: templateService);
  final userRepo = LocalUserRepository(service: userService);

  return [
    ChangeNotifierProvider<AdminAuthViewModel>(
      create: (_) => AdminAuthViewModel(authRepo),
    ),
    ChangeNotifierProvider<DashboardViewModel>(
      create: (_) => DashboardViewModel(userRepo),
    ),
    ChangeNotifierProvider<AdminTemplateViewModel>(
      create: (_) => AdminTemplateViewModel(templateRepo),
    ),
    ChangeNotifierProvider<UserViewModel>(
      create: (_) => UserViewModel(userRepo),
    ),
  ];
}
