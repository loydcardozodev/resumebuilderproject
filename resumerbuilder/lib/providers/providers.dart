import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:resumerbuilder/config/app_config.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/data/repository/auth/firebase_auth_repository.dart';
import 'package:resumerbuilder/data/repository/auth/local_auth_repository.dart';
import 'package:resumerbuilder/data/repository/resume_repository/firebase_resume_repository.dart';
import 'package:resumerbuilder/data/repository/resume_repository/local_resume_repository.dart';
import 'package:resumerbuilder/data/repository/resume_repository/resume_repository.dart';
import 'package:resumerbuilder/data/repository/template_repository/firebase_template_repository.dart';
import 'package:resumerbuilder/data/repository/template_repository/local_template_repository.dart';
import 'package:resumerbuilder/data/repository/template_repository/template_repository.dart';
import 'package:resumerbuilder/data/services/firebase/firebase_auth_service.dart';
import 'package:resumerbuilder/data/services/firebase/firebase_profile_service.dart';
import 'package:resumerbuilder/data/services/firebase/firebase_resume_service.dart';
import 'package:resumerbuilder/data/services/firebase/firebase_template_service.dart';
import 'package:resumerbuilder/data/services/local/local_auth_service.dart';
import 'package:resumerbuilder/data/services/local/local_profile_service.dart';
import 'package:resumerbuilder/data/services/local/local_resume_service.dart';
import 'package:resumerbuilder/data/services/local/local_template_service.dart';
import 'package:resumerbuilder/ui/createtemplate/viewmodel/template_viewmodel.dart';
import 'package:resumerbuilder/ui/login/login_viewmodel.dart';
import 'package:resumerbuilder/ui/profile/viewmodel/profile_viewmodel.dart';
import 'package:resumerbuilder/ui/viewmodel/auth_viewmodel.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

List<SingleChildWidget> buildProviders(AppConfig config) {
  return config.useFirebase ? _firebaseProviders() : _localProviders();
}

// ── Firebase ──────────────────────────────────────────────────────────────────

List<SingleChildWidget> _firebaseProviders() {
  final authService = FirebaseAuthService();
  final resumeService = FirebaseResumeService();
  final templateService = FirebaseTemplateService();
  final profileService = FirebaseProfileService();

  final AuthRepository authRepo = FirebaseAuthRepository(service: authService);
  final ResumeRepository resumeRepo = FirebaseResumeRepository(
    service: resumeService,
  );
  final TemplateRepository templateRepo = FirebaseTemplateRepository(
    service: templateService,
  );

  return [
    Provider<AuthRepository>.value(value: authRepo),
    Provider<ResumeRepository>.value(value: resumeRepo),
    Provider<TemplateRepository>.value(value: templateRepo),
    ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel(authRepo),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(authRepository: authRepo),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(authRepo, profileService),
    ),
    ChangeNotifierProvider<ResumeDraftViewModel>(
      create: (_) => ResumeDraftViewModel(resumeRepo),
    ),
    ChangeNotifierProvider<TemplateViewModel>(
      create: (_) => TemplateViewModel(templateRepo),
    ),
  ];
}

// ── Local ─────────────────────────────────────────────────────────────────────

List<SingleChildWidget> _localProviders() {
  final authService = LocalAuthService.instance;
  final resumeService = LocalResumeService.instance;
  final templateService = LocalTemplateService.instance;
  final profileService = LocalProfileService.instance;

  final AuthRepository authRepo = LocalAuthRepository(service: authService);
  final ResumeRepository resumeRepo = LocalResumeRepository(
    service: resumeService,
  );
  final TemplateRepository templateRepo = LocalTemplateRepository(
    service: templateService,
  );

  return [
    Provider<AuthRepository>.value(value: authRepo),
    Provider<ResumeRepository>.value(value: resumeRepo),
    Provider<TemplateRepository>.value(value: templateRepo),
    ChangeNotifierProvider<AuthViewModel>(
      create: (_) => AuthViewModel(authRepo),
    ),
    ChangeNotifierProvider<LoginViewModel>(
      create: (_) => LoginViewModel(authRepository: authRepo),
    ),
    ChangeNotifierProvider<ProfileViewModel>(
      create: (_) => ProfileViewModel(authRepo, profileService),
    ),
    ChangeNotifierProvider<ResumeDraftViewModel>(
      create: (_) => ResumeDraftViewModel(resumeRepo),
    ),
    ChangeNotifierProvider<TemplateViewModel>(
      create: (_) => TemplateViewModel(templateRepo),
    ),
  ];
}