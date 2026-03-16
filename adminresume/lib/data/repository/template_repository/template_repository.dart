import 'dart:typed_data';
import 'package:adminresume/data/models/resume_template/resume_template.dart';
import 'package:adminresume/util/result.dart';

abstract interface class AdminTemplateRepository {
  Future<Result<List<ResumeTemplate>>> getTemplates();
  Future<Result<ResumeTemplate>> addTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  });
  Future<Result<void>> updateTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  });
  Future<Result<void>> deleteTemplate(String id);
}
