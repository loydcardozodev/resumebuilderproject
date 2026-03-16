import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:adminresume/data/repository/user/user_repository.dart';
import 'package:adminresume/data/services/firebase/firebase_user_service.dart';
import 'package:adminresume/util/result.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository({required FirebaseUserService service})
    : _service = service;

  final FirebaseUserService _service;

  @override
  Future<Result<List<AdminUser>>> getUsers() async {
    try {
      return Result.ok(await _service.getUsers());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> blockUser(String uid, bool block) async {
    try {
      await _service.blockUser(uid, block);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteUser(String uid) async {
    try {
      await _service.deleteUser(uid);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<Map<String, dynamic>>>> getUserResumes(String uid) async {
    try {
      return Result.ok(await _service.getUserResumes(uid));
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<Map<String, int>>> getDashboardStats() async {
    try {
      return Result.ok(await _service.getDashboardStats());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
