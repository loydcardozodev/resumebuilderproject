import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';
import 'package:resumerbuilder/util/result.dart';

abstract class TemplateRepository {
  Future<Result<List<ResumeTemplate>>> getTemplates();
  Future<Result<ResumeTemplate>> getTemplateById(String id);
}
