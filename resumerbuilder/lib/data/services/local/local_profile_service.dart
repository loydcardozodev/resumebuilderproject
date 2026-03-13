import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/services/local/local_auth_service.dart';

class LocalProfileService {
  LocalProfileService._();
  static final LocalProfileService instance = LocalProfileService._();

  Future<AppUser?> getProfile(String uid) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return LocalAuthService.instance.currentUser;
  }

  Future<void> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    await LocalAuthService.instance.updateProfile(
      uid: uid,
      name: name,
      email: email,
    );
  }

  Future<void> updatePhoto({
    required String uid,
    required String photoUrl,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // Store photo path locally — hook up to file system when ready
  }
}
