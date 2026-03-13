import 'package:resumerbuilder/data/models/app_user/app_user.dart';

class LocalAuthService {
  LocalAuthService._();
  static final LocalAuthService instance = LocalAuthService._();

  // ── Mock users ────────────────────────────────────────────────────────────

  static final List<Map<String, String>> _users = [
    {
      'uid': 'local-u1',
      'name': 'Test User',
      'email': 'test@test.com',
      'password': 'Test123',
    },
    {
      'uid': 'local-u2',
      'name': 'Jane Doe',
      'email': 'jane@test.com',
      'password': 'Test123',
    },
  ];

  AppUser? _currentUser;

  // ── Private Helpers ───────────────────────────────────────────────────────

  AppUser? _findUser(String email, String password) {
    try {
      final match = _users.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
      );
      return AppUser(
        uid: match['uid']!,
        name: match['name']!,
        email: match['email']!,
      );
    } catch (_) {
      return null;
    }
  }

  // ── Public API ────────────────────────────────────────────────────────────

  Future<AppUser?> get currentUser async => _currentUser;

  Stream<AppUser?> get authStateChanges async* {
    yield _currentUser;
  }

  Future<AppUser> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final user = _findUser(email, password);
    if (user == null) throw Exception('Invalid email or password.');
    _currentUser = user;
    return user;
  }

  Future<AppUser> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final uid = 'local-u${_users.length + 1}';
    _users.add({
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
    });
    _currentUser = AppUser(uid: uid, name: name, email: email);
    return _currentUser!;
  }

  Future<void> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _users.indexWhere((u) => u['uid'] == uid);
    if (index != -1) {
      _users[index] = {..._users[index], 'name': name, 'email': email};
      _currentUser = _currentUser?.copyWith(name: name, email: email);
    }
  }

  Future<void> logout() async {
    _currentUser = null;
  }

  Future<void> deleteAccount(String uid) async {
    _users.removeWhere((u) => u['uid'] == uid);
    _currentUser = null;
  }
}
