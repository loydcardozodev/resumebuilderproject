import 'package:adminresume/util/result.dart';

abstract interface class AuthRepository {
  Stream<bool> get isSignedIn;
  Future<Result<void>> signIn(String email, String password);
  Future<Result<void>> signOut();
}