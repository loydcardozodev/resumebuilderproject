import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';
import 'package:resumerbuilder/data/repository/template_repository/template_repository.dart';
import 'package:resumerbuilder/data/services/local/local_template_service.dart';
import 'package:resumerbuilder/util/result.dart';

class LocalTemplateRepository implements TemplateRepository {
  LocalTemplateRepository({required LocalTemplateService service})
    : _service = service;

  final LocalTemplateService _service;

  @override
  Future<Result<List<ResumeTemplate>>> getTemplates() async {
    try {
      final templates = await _service.getTemplates();
      return Result.ok(templates);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<ResumeTemplate>> getTemplateById(String id) async {
    try {
      final template = await _service.getTemplateById(id);
      return Result.ok(template);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
