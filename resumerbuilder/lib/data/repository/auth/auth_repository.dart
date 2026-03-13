import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/ui/widget/result.dart';

abstract class AuthRepository {
  AppUser? get currentUser;
  Stream<AppUser?> get authStateChanges;

  Future<Result<AppUser>> login({
    required String email,
    required String password,
  });

  Future<Result<AppUser>> signup({
    required String email,
    required String password,
    required String name,
  });

  Future<Result<void>> updateProfile({
    required String uid,
    required String name,
    required String email,
  });

  Future<Result<void>> logout();

  Future<Result<void>> deleteAccount(String uid);
}
