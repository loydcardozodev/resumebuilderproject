import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:adminresume/data/services/local/local_template_service.dart';

class LocalUserService {
  LocalUserService._();
  static final LocalUserService instance = LocalUserService._();

  final List<AdminUser> _users = [
    AdminUser(
      uid: 'local-u1',
      name: 'Test User',
      email: 'test@test.com',
      resumeCount: 3,
      joinedAt: DateTime.now().subtract(const Duration(days: 10)),
      isBlocked: false,
    ),
    AdminUser(
      uid: 'local-u2',
      name: 'Jane Doe',
      email: 'jane@test.com',
      resumeCount: 1,
      joinedAt: DateTime.now().subtract(const Duration(days: 40)),
      isBlocked: false,
    ),
    AdminUser(
      uid: 'local-u3',
      name: 'John Smith',
      email: 'john@test.com',
      resumeCount: 5,
      joinedAt: DateTime.now().subtract(const Duration(days: 5)),
      isBlocked: true,
    ),
    AdminUser(
      uid: 'local-u4',
      name: 'Alice Brown',
      email: 'alice@test.com',
      resumeCount: 2,
      joinedAt: DateTime.now().subtract(const Duration(days: 20)),
      isBlocked: false,
    ),
    AdminUser(
      uid: 'local-u5',
      name: 'Bob Wilson',
      email: 'bob@test.com',
      resumeCount: 0,
      joinedAt: DateTime.now().subtract(const Duration(days: 2)),
      isBlocked: false,
    ),
  ];

  final Map<String, List<Map<String, dynamic>>> _resumes = {
    'local-u1': [
      {
        'id': 'r1',
        'title': 'Software Engineer Resume',
        'createdAt': '2024-01-10',
      },
      {
        'id': 'r2',
        'title': 'Flutter Developer Resume',
        'createdAt': '2024-02-15',
      },
      {'id': 'r3', 'title': 'Mobile Dev Resume', 'createdAt': '2024-03-01'},
    ],
    'local-u2': [
      {'id': 'r4', 'title': 'Designer Resume', 'createdAt': '2024-01-20'},
    ],
    'local-u3': [
      {'id': 'r5', 'title': 'Backend Dev Resume', 'createdAt': '2024-02-01'},
      {'id': 'r6', 'title': 'DevOps Resume', 'createdAt': '2024-03-10'},
      {'id': 'r7', 'title': 'Cloud Engineer Resume', 'createdAt': '2024-04-01'},
      {'id': 'r8', 'title': 'SRE Resume', 'createdAt': '2024-04-15'},
      {'id': 'r9', 'title': 'Systems Admin Resume', 'createdAt': '2024-05-01'},
    ],
    'local-u4': [
      {
        'id': 'r10',
        'title': 'Product Manager Resume',
        'createdAt': '2024-02-20',
      },
      {
        'id': 'r11',
        'title': 'Business Analyst Resume',
        'createdAt': '2024-03-05',
      },
    ],
  };

  Future<List<AdminUser>> getUsers() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_users);
  }

  Future<void> blockUser(String uid, bool block) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _users.indexWhere((u) => u.uid == uid);
    if (index >= 0) {
      _users[index] = _users[index].copyWith(isBlocked: block);
    }
  }

  Future<void> deleteUser(String uid) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _users.removeWhere((u) => u.uid == uid);
    _resumes.remove(uid);
  }

  Future<List<Map<String, dynamic>>> getUserResumes(String uid) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_resumes[uid] ?? []);
  }

  Future<Map<String, int>> getDashboardStats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    final now = DateTime.now();
    int totalResumes = 0;
    int newUsersThisMonth = 0;

    for (final user in _users) {
      totalResumes += user.resumeCount;
      if (user.joinedAt.year == now.year && user.joinedAt.month == now.month) {
        newUsersThisMonth++;
      }
    }

    return {
      'totalUsers': _users.length,
      'totalTemplates': LocalTemplateService.instance.templateCount,
      'totalResumes': totalResumes,
      'newUsersThisMonth': newUsersThisMonth,
    };
  }
}
