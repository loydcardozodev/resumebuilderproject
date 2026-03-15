import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/util/result.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login({required String email, required String password}) async {
    _setLoading(true);

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    switch (result) {
      case Ok<AppUser>():
        _setLoading(false);
        return true;

      case Error<AppUser>(:final error):
        _errorMessage = _mapError(error);
        _setLoading(false);
        return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _mapError(Exception error) {
    final message = error.toString();

    if (message.contains('user-not-found')) {
      return 'No account found for this email.';
    } else if (message.contains('wrong-password')) {
      return 'Incorrect password. Please try again.';
    } else if (message.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    } else if (message.contains('user-disabled')) {
      return 'This account has been disabled.';
    } else if (message.contains('too-many-requests')) {
      return 'Too many attempts. Please try again later.';
    } else if (message.contains('invalid-credential')) {
      return 'Invalid email or password.';
    }

    return 'Login failed. Please try again.';
  }
}
