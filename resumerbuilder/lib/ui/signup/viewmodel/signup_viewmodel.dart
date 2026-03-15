import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/app_user/app_user.dart';
import 'package:resumerbuilder/data/repository/auth/auth_repository.dart';
import 'package:resumerbuilder/util/result.dart';

class SignupViewModel extends ChangeNotifier {
  SignupViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    _setLoading(true);

    final result = await _authRepository.signup(
      email: email,
      password: password,
      name: name,
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

    if (message.contains('email-already-in-use')) {
      return 'An account already exists for this email.';
    } else if (message.contains('invalid-email')) {
      return 'Please enter a valid email address.';
    } else if (message.contains('weak-password')) {
      return 'Password is too weak. Use at least 6 characters.';
    } else if (message.contains('operation-not-allowed')) {
      return 'Email/password sign up is not enabled.';
    }

    return 'Sign up failed. Please try again.';
  }
}