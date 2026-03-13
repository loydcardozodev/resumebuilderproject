import 'package:flutter/foundation.dart';
import 'package:resumerbuilder/data/models/resume/resume.dart';
import 'package:resumerbuilder/data/models/personal_info/personal_info.dart';
import 'package:resumerbuilder/data/models/career_entry/career_entry.dart';
import 'package:resumerbuilder/data/models/education_entry/education_entry.dart';
import 'package:resumerbuilder/data/models/project_entry/project_entry.dart';
import 'package:resumerbuilder/data/models/reference_entry/reference_entry.dart';
import 'package:resumerbuilder/data/repository/resume_repository/resume_repository.dart';
import 'package:resumerbuilder/ui/widget/result.dart';

class ResumeDraftViewModel extends ChangeNotifier {
  ResumeDraftViewModel(this._repo);

  final ResumeRepository _repo;

  Resume draft = Resume.empty();
  List<Resume> resumes = [];
  bool isLoading = false;
  bool isSaving = false;
  String? errorMessage;

  // ── Called by each page ViewModel on Next ─────────────────────────────────

  void updatePersonalInfo(PersonalInfo info) {
    draft = draft.copyWith(personalInfo: info);
    notifyListeners();
  }

  void updateCareer(List<CareerEntry> career) {
    draft = draft.copyWith(career: career);
    notifyListeners();
  }

  void updateEducation(List<EducationEntry> education) {
    draft = draft.copyWith(education: education);
    notifyListeners();
  }

  void updateKeySkills(List<String> skills) {
    draft = draft.copyWith(keySkills: skills);
    notifyListeners();
  }

  void updateProjects(List<ProjectEntry> projects) {
    draft = draft.copyWith(projects: projects);
    notifyListeners();
  }

  void updateInterests(List<String> interests) {
    draft = draft.copyWith(interests: interests);
    notifyListeners();
  }

  void updateReferences(List<ReferenceEntry> references) {
    draft = draft.copyWith(references: references);
    notifyListeners();
  }

  void selectTemplate(String templateId) {
    draft = draft.copyWith(selectedTemplateId: templateId);
    notifyListeners();
  }

  void resetDraft() {
    draft = Resume.empty();
    notifyListeners();
  }

  // ── Persistence ───────────────────────────────────────────────────────────

  Future<void> loadResumes(String uid) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.getResumes(uid);

    switch (result) {
      case Success<List<Resume>>():
        resumes = result.value;
      case Failure<List<Resume>>():
        errorMessage = result.message;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<bool> saveDraft(String uid) async {
    isSaving = true;
    errorMessage = null;
    notifyListeners();

    final result = await _repo.saveResume(uid, draft);

    isSaving = false;

    switch (result) {
      case Success<Resume>():
        draft = result.value;
        final index = resumes.indexWhere((r) => r.id == draft.id);
        if (index >= 0) {
          resumes = [...resumes]..[index] = draft;
        } else {
          resumes = [...resumes, draft];
        }
        notifyListeners();
        return true;
      case Failure<Resume>():
        errorMessage = result.message;
        notifyListeners();
        return false;
    }
  }

  Future<bool> deleteResume(String uid, String resumeId) async {
    final result = await _repo.deleteResume(uid, resumeId);
    if (result is Success) {
      resumes = resumes.where((r) => r.id != resumeId).toList();
      notifyListeners();
      return true;
    }
    return false;
  }

  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}