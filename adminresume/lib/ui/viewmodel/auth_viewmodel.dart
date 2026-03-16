import 'package:adminresume/data/repository/auth/auth_repository.dart';
import 'package:adminresume/util/result.dart';
import 'package:flutter/foundation.dart';

class AdminAuthViewModel extends ChangeNotifier {
  AdminAuthViewModel(this._repo);

  final AuthRepository _repo;

  bool isLoading = false;
  String? errorMessage;

  Stream<bool> get isSignedIn => _repo.isSignedIn;

  Future<bool> signIn(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.signIn(email, password);

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

  Future<void> signOut() async {
    await _repo.signOut();
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
