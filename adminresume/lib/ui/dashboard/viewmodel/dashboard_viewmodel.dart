import 'package:adminresume/data/repository/user/user_repository.dart';
import 'package:adminresume/util/result.dart';
import 'package:flutter/foundation.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel(this._repo);

  final UserRepository _repo;

  int totalUsers = 0;
  int totalTemplates = 0;
  int totalResumes = 0;
  int newUsersThisMonth = 0;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadStats() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.getDashboardStats();

    switch (result) {
      case Ok<Map<String, int>>():
        totalUsers = result.value['totalUsers'] ?? 0;
        totalTemplates = result.value['totalTemplates'] ?? 0;
        totalResumes = result.value['totalResumes'] ?? 0;
        newUsersThisMonth = result.value['newUsersThisMonth'] ?? 0;
      case Error<Map<String, int>>():
        errorMessage = result.error.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
