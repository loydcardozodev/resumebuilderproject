import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/data/services/local/local_auth_service.dart';
import 'package:resumerbuilder/ui/widget/result.dart';

class LocalAuthRepository implements AuthRepository {
  LocalAuthRepository({required LocalAuthService service}) : _service = service;

  final LocalAuthService _service;

  AppUser? _currentUser;

  @override
  AppUser? get currentUser => _currentUser;

  @override
  Stream<AppUser?> get authStateChanges => _service.authStateChanges;

  @override
  Future<Result<AppUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _service.login(email, password);
      _currentUser = user;
      return Success(user);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<AppUser>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await _service.signup(
        email: email,
        password: password,
        name: name,
      );
      _currentUser = user;
      return Success(user);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    try {
      await _service.updateProfile(uid: uid, name: name, email: email);
      _currentUser = _currentUser?.copyWith(name: name, email: email);
      return const Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _service.logout();
      _currentUser = null;
      return const Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> deleteAccount(String uid) async {
    try {
      await _service.deleteAccount(uid);
      _currentUser = null;
      return const Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
