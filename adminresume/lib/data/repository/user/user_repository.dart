import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:adminresume/util/result.dart';

abstract interface class UserRepository {
  Future<Result<List<AdminUser>>> getUsers();
  Future<Result<void>> blockUser(String uid, bool block);
  Future<Result<void>> deleteUser(String uid);
  Future<Result<List<Map<String, dynamic>>>> getUserResumes(String uid);
  Future<Result<Map<String, int>>> getDashboardStats();
}
