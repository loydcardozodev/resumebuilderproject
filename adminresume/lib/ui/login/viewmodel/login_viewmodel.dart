import 'package:adminresume/data/repository/auth/auth_repository.dart';
import 'package:adminresume/util/result.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this._repo);

  final AuthRepository _repo;

  bool isLoading = false;
  String? errorMessage;

  Future<bool> signIn(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      errorMessage = 'Email and password are required.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.signIn(email.trim(), password.trim());

    isLoading = false;

    switch (result) {
      case Ok<void>():
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
}
