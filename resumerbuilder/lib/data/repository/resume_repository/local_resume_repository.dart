import 'package:resumerbuilder/data/models/resume/resume.dart';
import 'package:resumerbuilder/data/repository/resume_repository/resume_repository.dart';
import 'package:resumerbuilder/data/services/local/local_resume_service.dart';
import 'package:resumerbuilder/ui/widget/result.dart';

class LocalResumeRepository implements ResumeRepository {
  LocalResumeRepository({required LocalResumeService service})
    : _service = service;

  final LocalResumeService _service;

  @override
  Future<Result<List<Resume>>> getResumes(String uid) async {
    try {
      final resumes = await _service.getResumes(uid);
      return Success(resumes);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<Resume>> saveResume(String uid, Resume resume) async {
    try {
      final saved = await _service.saveResume(uid, resume);
      return Success(saved);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> deleteResume(String uid, String resumeId) async {
    try {
      await _service.deleteResume(uid, resumeId);
      return const Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
