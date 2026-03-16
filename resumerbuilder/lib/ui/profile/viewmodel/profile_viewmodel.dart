import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/data/services/firebase/firebase_profile_service.dart';
import 'package:resumerbuilder/data/services/local/local_profile_service.dart';
import 'package:resumerbuilder/util/result.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(this._authRepo, this._profileService);

  final AuthRepository _authRepo;
  final Object _profileService;

  AppUser? profile;
  bool isLoading = false;
  bool isSaving = false;
  String? errorMessage;

  // ── Load ──────────────────────────────────────────────────────────────────

  Future<void> loadProfile(String uid) async {
    isLoading = true;
    notifyListeners();

    try {
      AppUser? fetched;
      if (_profileService is FirebaseProfileService) {
        fetched = await _profileService.getProfile(uid);
      } else if (_profileService is LocalProfileService) {
        fetched = await _profileService.getProfile(uid);
      }
      profile = fetched;
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // ── Update Profile ────────────────────────────────────────────────────────

  Future<bool> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    isSaving = true;
    errorMessage = null;
    notifyListeners();

    final result = await _authRepo.updateProfile(
      uid: uid,
      name: name,
      email: email,
    );

    isSaving = false;

    switch (result) {
      case Ok<void>():
        profile = profile?.copyWith(name: name, email: email);
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  // ── Logout ────────────────────────────────────────────────────────────────

  Future<bool> logout() async {
    final result = await _authRepo.logout();
    if (result is Ok) {
      profile = null;
      notifyListeners();
      return true;
    }
    return false;
  }

  // ── Delete Account ────────────────────────────────────────────────────────

  Future<bool> deleteAccount(String uid) async {
    final result = await _authRepo.deleteAccount(uid);
    if (result is Ok) {
      profile = null;
      notifyListeners();
      return true;
    }
    return false;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
