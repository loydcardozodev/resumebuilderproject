import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resumerbuilder/data/models/resume/resume.dart';

class FirebaseResumeService {
  FirebaseResumeService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference _col(String uid) =>
      _firestore.collection('users').doc(uid).collection('resumes');

  Future<List<Resume>> getResumes(String uid) async {
    final snap = await _col(uid).get();
    return snap.docs
        .map((d) => Resume.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  Future<Resume> saveResume(String uid, Resume resume) async {
    if (resume.id == null) {
      final ref = _col(uid).doc();
      final withId = resume.copyWith(id: ref.id);
      await ref.set(withId.toJson());
      return withId;
    } else {
      await _col(uid).doc(resume.id).set(resume.toJson());
      return resume;
    }
  }

  Future<void> deleteResume(String uid, String resumeId) async {
    await _col(uid).doc(resumeId).delete();
  }
}
