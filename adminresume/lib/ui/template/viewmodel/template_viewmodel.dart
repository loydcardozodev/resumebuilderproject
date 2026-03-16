import 'dart:typed_data';
import 'package:adminresume/data/models/resume_template/resume_template.dart';
import 'package:adminresume/data/repository/template_repository/template_repository.dart';
import 'package:adminresume/util/result.dart';
import 'package:flutter/foundation.dart';

class AdminTemplateViewModel extends ChangeNotifier {
  AdminTemplateViewModel(this._repo);

  final AdminTemplateRepository _repo;

  List<ResumeTemplate> templates = [];
  bool isLoading = false;
  bool isSaving = false;
  String? errorMessage;

  Future<void> loadTemplates() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.getTemplates();

    switch (result) {
      case Ok<List<ResumeTemplate>>():
        templates = result.value;
      case Error<List<ResumeTemplate>>():
        errorMessage = result.error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> addTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    isSaving = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.addTemplate(
      template,
      thumbnailBytes: thumbnailBytes,
      fileName: fileName,
    );

    isSaving = false;

    switch (result) {
      case Ok<ResumeTemplate>():
        templates = [...templates, result.value];
        notifyListeners();
        return true;
      case Error<ResumeTemplate>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> updateTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    isSaving = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.updateTemplate(
      template,
      thumbnailBytes: thumbnailBytes,
      fileName: fileName,
    );

    isSaving = false;

    switch (result) {
      case Ok<void>():
        final index = templates.indexWhere((t) => t.id == template.id);
        if (index >= 0) {
          templates = [...templates]..[index] = template;
        }
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  Future<bool> deleteTemplate(String id) async {
    final result = await _repo.deleteTemplate(id);

    switch (result) {
      case Ok<void>():
        templates = templates.where((t) => t.id != id).toList();
        notifyListeners();
        return true;
      case Error<void>():
        errorMessage = result.error.toString();
        notifyListeners();
        return false;
    }
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
