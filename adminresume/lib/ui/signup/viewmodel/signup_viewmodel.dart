import 'package:adminresume/data/repository/auth/auth_repository.dart';
import 'package:flutter/foundation.dart';

class SignupViewModel extends ChangeNotifier {
  SignupViewModel(this._authRepository);

  final AuthRepository _authRepository;

  bool isLoading = false;
  String? errorMessage;

  Future<bool> signUp(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      errorMessage = 'Email and password are required.';
      notifyListeners();
      return false;
    }

    if (password.length < 6) {
      errorMessage = 'Password must be at least 6 characters.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    isLoading = false;
    errorMessage = 'Admin accounts are created via Firebase Console.';
    notifyListeners();
    return false;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
