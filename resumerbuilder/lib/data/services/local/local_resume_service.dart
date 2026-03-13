import 'package:resumerbuilder/data/models/resume/resume.dart';

class LocalResumeService {
  LocalResumeService._();
  static final LocalResumeService instance = LocalResumeService._();

  final List<Resume> _store = [];
  int _idCounter = 1;

  Future<List<Resume>> getResumes(String uid) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_store);
  }

  Future<Resume> saveResume(String uid, Resume resume) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (resume.id == null) {
      final saved = resume.copyWith(id: 'local-resume-${_idCounter++}');
      _store.add(saved);
      return saved;
    } else {
      final index = _store.indexWhere((r) => r.id == resume.id);
      if (index >= 0) {
        _store[index] = resume;
      } else {
        _store.add(resume);
      }
      return resume;
    }
  }

  Future<void> deleteResume(String uid, String resumeId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _store.removeWhere((r) => r.id == resumeId);
  }
}
