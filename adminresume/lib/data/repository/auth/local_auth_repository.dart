import 'package:adminresume/data/repository/auth/auth_repository.dart';
import 'package:adminresume/data/services/local/local_auth_service.dart';
import 'package:adminresume/util/result.dart';

class LocalAdminAuthRepository implements AuthRepository {
  LocalAdminAuthRepository({required LocalAdminAuthService service})
    : _service = service;

  final LocalAdminAuthService _service;

  @override
  Stream<bool> get isSignedIn => _service.authStateChanges;

  @override
  Future<Result<void>> signIn(String email, String password) async {
    try {
      await _service.signIn(email, password);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _service.signOut();
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
