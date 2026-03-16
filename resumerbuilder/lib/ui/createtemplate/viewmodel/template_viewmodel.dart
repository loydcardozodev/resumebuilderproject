import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';
import 'package:resumerbuilder/data/repository/template_repository/template_repository.dart';
import 'package:resumerbuilder/util/result.dart';

class TemplateViewModel extends ChangeNotifier {
  TemplateViewModel(this._repo);

  final TemplateRepository _repo;

  List<ResumeTemplate> templates = [];
  ResumeTemplate? selected;
  bool isLoading = false;
  String? errorMessage;

  // ── Load ──────────────────────────────────────────────────────────────────

  Future<void> loadTemplates() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.getTemplates();

    switch (result) {
      case Ok<List<ResumeTemplate>>():
        templates = result.value;
        selected ??= templates.isNotEmpty ? templates.first : null;
      case Error<List<ResumeTemplate>>():
        errorMessage = result.error.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  // ── Select ────────────────────────────────────────────────────────────────

  void selectTemplate(ResumeTemplate template) {
    selected = template;
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}