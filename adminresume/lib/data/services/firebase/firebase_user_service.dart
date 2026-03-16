import 'package:adminresume/data/models/admin_user/admin_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseUserService {
  final _db = FirebaseFirestore.instance;

  static const _users = 'users';
  static const _resumes = 'resumes';

  Future<List<AdminUser>> getUsers() async {
    final snap = await _db.collection(_users).get();
    return snap.docs.map((d) => AdminUser.fromMap(d.id, d.data())).toList();
  }

  Future<void> blockUser(String uid, bool block) async {
    await _db.collection(_users).doc(uid).update({'isBlocked': block});
  }

  Future<void> deleteUser(String uid) async {
    final resumes = await _db
        .collection(_users)
        .doc(uid)
        .collection(_resumes)
        .get();
    for (final doc in resumes.docs) {
      await doc.reference.delete();
    }
    await _db.collection(_users).doc(uid).delete();
  }

  Future<List<Map<String, dynamic>>> getUserResumes(String uid) async {
    final snap = await _db
        .collection(_users)
        .doc(uid)
        .collection(_resumes)
        .get();
    return snap.docs.map((d) => {'id': d.id, ...d.data()}).toList();
  }

  Future<Map<String, int>> getDashboardStats() async {
    final users = await _db.collection(_users).get();
    final templates = await _db.collection('templates').get();

    int totalResumes = 0;
    int newUsersThisMonth = 0;
    final now = DateTime.now();

    for (final doc in users.docs) {
      final data = doc.data();
      totalResumes += (data['resumeCount'] as int? ?? 0);
      final joined = DateTime.tryParse(data['joinedAt'] as String? ?? '');
      if (joined != null &&
          joined.year == now.year &&
          joined.month == now.month) {
        newUsersThisMonth++;
      }
    }

    return {
      'totalUsers': users.size,
      'totalTemplates': templates.size,
      'totalResumes': totalResumes,
      'newUsersThisMonth': newUsersThisMonth,
    };
  }

  Future<void> incrementResumeCount(String uid) async {
    await _db.collection(_users).doc(uid).update({
      'resumeCount': FieldValue.increment(1),
    });
  }

  Future<void> decrementResumeCount(String uid) async {
    await _db.collection(_users).doc(uid).update({
      'resumeCount': FieldValue.increment(-1),
    });
  }
}
