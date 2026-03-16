import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:adminresume/data/repository/user/user_repository.dart';
import 'package:adminresume/util/result.dart';
import 'package:flutter/foundation.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._repo);

  final UserRepository _repo;

  List<AdminUser> users = [];
  List<Map<String, dynamic>> selectedUserResumes = [];
  bool isLoading = false;
  bool isActionLoading = false;
  String? errorMessage;
  String searchQuery = '';

  List<AdminUser> get filtered {
    if (searchQuery.isEmpty) return users;
    return users
        .where(
          (u) =>
              u.email.toLowerCase().contains(searchQuery.toLowerCase()) ||
              u.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  Future<void> loadUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.getUsers();

    switch (result) {
      case Ok<List<AdminUser>>():
        users = result.value;
      case Error<List<AdminUser>>():
        errorMessage = result.error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> blockUser(String uid, bool block) async {
    isActionLoading = true;
    notifyListeners();

    final result = await _repo.blockUser(uid, block);

    isActionLoading = false;

    switch (result) {
      case Ok<void>():
        final index = users.indexWhere((u) => u.uid == uid);
        if (index >= 0) {
          users = [...users]..[index] = users[index].copyWith(isBlocked: block);
        }
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> deleteUser(String uid) async {
    isActionLoading = true;
    notifyListeners();

    final result = await _repo.deleteUser(uid);

    isActionLoading = false;

    switch (result) {
      case Ok<void>():
        users = users.where((u) => u.uid != uid).toList();
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<void> loadUserResumes(String uid) async {
    isLoading = true;
    notifyListeners();

    final result = await _repo.getUserResumes(uid);

    switch (result) {
      case Ok<List<Map<String, dynamic>>>():
        selectedUserResumes = result.value;
      case Error<List<Map<String, dynamic>>>():
        errorMessage = result.error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  void updateSearch(String query) {
    searchQuery = query;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
