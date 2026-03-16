import 'package:adminresume/data/models/admin_user/admin_user.dart';

class LocalAdminAuthService {
  LocalAdminAuthService._();
  static final LocalAdminAuthService instance = LocalAdminAuthService._();

  static final List<Map<String, String>> _admins = [
    {
      'uid': 'admin-u1',
      'name': 'Admin User',
      'email': 'admin@test.com',
      'password': 'Admin123',
    },
  ];

  AdminUser? _currentAdmin;

  AdminUser? get currentAdmin => _currentAdmin;

  Stream<bool> get authStateChanges async* {
    yield _currentAdmin != null;
  }

  Future<AdminUser> signIn(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final match = _admins.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
      );
      _currentAdmin = AdminUser(
        uid: match['uid']!,
        name: match['name']!,
        email: match['email']!,
        resumeCount: 0,
        joinedAt: DateTime(2024, 1, 1),
        isBlocked: false,
      );
      return _currentAdmin!;
    } catch (_) {
      throw Exception('Invalid email or password.');
    }
  }

  Future<void> signOut() async {
    _currentAdmin = null;
  }
}
