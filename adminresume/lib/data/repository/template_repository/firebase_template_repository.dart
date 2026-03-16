import 'dart:typed_data';
import 'package:adminresume/data/models/resume_template/resume_template.dart';
import 'package:adminresume/data/repository/template_repository/template_repository.dart';
import 'package:adminresume/data/services/firebase/firebase_template_service.dart';
import 'package:adminresume/util/result.dart';

class FirebaseAdminTemplateRepository implements AdminTemplateRepository {
  FirebaseAdminTemplateRepository({required FirebaseTemplateService service})
    : _service = service;

  final FirebaseTemplateService _service;

  @override
  Future<Result<List<ResumeTemplate>>> getTemplates() async {
    try {
      return Result.ok(await _service.getTemplates());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<ResumeTemplate>> addTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    try {
      return Result.ok(
        await _service.addTemplate(
          template,
          thumbnailBytes: thumbnailBytes,
          fileName: fileName,
        ),
      );
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> updateTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    try {
      await _service.updateTemplate(
        template,
        thumbnailBytes: thumbnailBytes,
        fileName: fileName,
      );
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<void>> deleteTemplate(String id) async {
    try {
      await _service.deleteTemplate(id);
      return const Result.ok(null);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
