import 'package:resumerbuilder/data/models/resume/resume.dart';
import 'package:resumerbuilder/util/result.dart';

abstract class ResumeRepository {
  Future<Result<List<Resume>>> getResumes(String uid);
  Future<Result<Resume>> saveResume(String uid, Resume resume);
  Future<Result<void>> deleteResume(String uid, String resumeId);
}
