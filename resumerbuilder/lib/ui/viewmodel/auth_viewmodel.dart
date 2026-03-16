import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/util/result.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this._repo);

  final AuthRepository _repo;

  AppUser? currentUser;
  bool isLoading = false;
  String? errorMessage;

  Stream<AppUser?> get authStateChanges => _repo.authStateChanges;

  Future<bool> login({required String email, required String password}) async {
    _setLoading(true);
    final result = await _repo.login(email: email, password: password);
    _setLoading(false);

    switch (result) {
      case Ok<AppUser>():
        currentUser = result.value;
        errorMessage = null;
        notifyListeners();
        return true;
      case Error<AppUser>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

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
      case Ok<AppUser>():
        currentUser = result.value;
        errorMessage = null;
        notifyListeners();
        return true;
      case Error<AppUser>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> logout() async {
    _setLoading(true);
    final result = await _repo.logout();
    _setLoading(false);

    switch (result) {
      case Ok<void>():
        currentUser = null;
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> deleteAccount() async {
    if (currentUser == null) return false;
    _setLoading(true);
    final result = await _repo.deleteAccount(currentUser!.uid);
    _setLoading(false);

    switch (result) {
      case Ok<void>():
        currentUser = null;
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
