import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/ui/widget/result.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this._repo);

  final AuthRepository _repo;

  AppUser? currentUser;
  bool isLoading = false;
  String? errorMessage;

  // ── Auth State ────────────────────────────────────────────────────────────

  Stream<AppUser?> get authStateChanges => _repo.authStateChanges;

  // ── Login ─────────────────────────────────────────────────────────────────

  Future<bool> login({required String email, required String password}) async {
    _setLoading(true);

    final result = await _repo.login(email: email, password: password);

    _setLoading(false);

    switch (result) {
      case Success<AppUser>():
        currentUser = result.value;
        errorMessage = null;
        notifyListeners();
        return true;
      case Failure<AppUser>():
        errorMessage = result.message;
        notifyListeners();
        return false;
    }
  }

  // ── Signup ────────────────────────────────────────────────────────────────

  Future<bool> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    _setLoading(true);

    final result = await _repo.signup(
      email: email,
      password: password,
      name: name,
    );

    _setLoading(false);

    switch (result) {
      case Success<AppUser>():
        currentUser = result.value;
        errorMessage = null;
        notifyListeners();
        return true;
      case Failure<AppUser>():
        errorMessage = result.message;
        notifyListeners();
        return false;
    }
  }

  // ── Logout ────────────────────────────────────────────────────────────────

  Future<bool> logout() async {
    _setLoading(true);

    final result = await _repo.logout();

    _setLoading(false);

    switch (result) {
      case Success<void>():
        currentUser = null;
        notifyListeners();
        return true;
      case Failure<void>():
        errorMessage = result.message;
        notifyListeners();
        return false;
    }
  }

  // ── Delete Account ────────────────────────────────────────────────────────

  Future<bool> deleteAccount() async {
    if (currentUser == null) return false;

    _setLoading(true);

    final result = await _repo.deleteAccount(currentUser!.uid);

    _setLoading(false);

    switch (result) {
      case Success<void>():
        currentUser = null;
        notifyListeners();
        return true;
      case Failure<void>():
        errorMessage = result.message;
        notifyListeners();
        return false;
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
