import 'package:adminresume/routing/routes.dart';
import 'package:adminresume/ui/dashboard/view/dashboard.dart';
import 'package:adminresume/ui/login/view/login.dart';
import 'package:adminresume/ui/profile/view/profile_view.dart';
import 'package:adminresume/ui/signup/view/signup.dart';
import 'package:adminresume/ui/template/view/template_management.dart';
import 'package:adminresume/ui/user/view/user_management.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: Routes.dashboard,
  routes: [
    GoRoute(
      path: Routes.dashboard,
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(path: Routes.signup, builder: (context, state) => const Signup()),
    GoRoute(path: Routes.login, builder: (context, state) => const Login()),
    GoRoute(
      path: Routes.template_mannagement,
      builder: (context, state) => const TemplateManagement(),
    ),
    GoRoute(
      path: Routes.user_management,
      builder: (context, state) => const UserManagement(),
    ),
    GoRoute(path: Routes.profile,builder: (context, state) => const ProfilePage())
  ],
);
