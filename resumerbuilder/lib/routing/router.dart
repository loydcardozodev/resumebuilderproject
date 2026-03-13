import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/createtemplate/view/createTemplate.dart';
import 'package:resumerbuilder/ui/details/career.dart';
import 'package:resumerbuilder/ui/details/education.dart';
import 'package:resumerbuilder/ui/details/interest.dart';
import 'package:resumerbuilder/ui/details/key_skills.dart';
import 'package:resumerbuilder/ui/details/personal_data.dart';
import 'package:resumerbuilder/ui/details/project.dart';
import 'package:resumerbuilder/ui/details/references.dart';
import 'package:resumerbuilder/ui/home/home_screen.dart';
import 'package:resumerbuilder/ui/login/login.dart';
import 'package:resumerbuilder/ui/preview/resumepreview.dart';
import 'package:resumerbuilder/ui/profile/view/profile.dart';
import 'package:resumerbuilder/ui/signup/signup.dart';
import 'package:resumerbuilder/ui/template/template.dart';

final authNotifier = AuthNotifier();

GoRouter router = GoRouter(
  refreshListenable: authNotifier,
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final isLoggingIn = state.uri.path == Routes.login;
    final isSigningUp = state.matchedLocation == '/signup';

    if (user == null && !isLoggingIn && !isSigningUp) {
      return '/login';
    }

    if (user != null && (isLoggingIn || isSigningUp)) {
      return '/home';
    }

    return null;
  },
  routes: [
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
    GoRoute(path: Routes.signup, builder: (context, state) => const Signup()),
    GoRoute(path: Routes.login, builder: (context, state) => const Login()),
    GoRoute(
      path: Routes.createtemp,
      builder: (context, state) => const CreateTemplatePage(),
    ),
    GoRoute(
      path: Routes.template,
      builder: (context, state) => const Template(),
    ),
    GoRoute(
      path: Routes.preview,
      builder: (context, state) => const Resumepreview(),
    ),
    GoRoute(
      path: Routes.personalData,
      builder: (context, state) => const PersonalData(),
    ),
    GoRoute(path: Routes.career, builder: (context, state) => const Career()),
    GoRoute(
      path: Routes.education,
      builder: (context, state) => const Education(),
    ),
    GoRoute(
      path: Routes.keySkills,
      builder: (context, state) => const KeySkills(),
    ),
    GoRoute(
      path: Routes.projects,
      builder: (context, state) => const Project(),
    ),
    GoRoute(
      path: Routes.interest,
      builder: (context, state) => const Interest(),
    ),
    GoRoute(
      path: Routes.references,
      builder: (context, state) => const References(),
    ),
    GoRoute(path: Routes.profile, builder: (context, state) => const Profile()),
  ],
);

class AuthNotifier extends ChangeNotifier {
  AuthNotifier() {
    FirebaseAuth.instance.userChanges().listen((_) {
      notifyListeners();
    });
  }
}
