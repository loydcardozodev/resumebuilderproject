import 'package:adminresume/data/repository/auth/auth_repository.dart';
import 'package:adminresume/data/services/firebase/firebase_auth_service.dart';
import 'package:adminresume/util/result.dart';

class FirebaseAdminAuthRepository implements AuthRepository {
  FirebaseAdminAuthRepository({required FirebaseAdminAuthService service})
    : _service = service;

  final FirebaseAdminAuthService _service;

  @override
  Stream<bool> get isSignedIn =>
      _service.authStateChanges.map((u) => u != null);

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
