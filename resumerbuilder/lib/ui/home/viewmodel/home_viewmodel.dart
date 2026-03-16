import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/resume/resume.dart';
import 'package:resumerbuilder/data/repository/resume_repository/resume_repository.dart';
import 'package:resumerbuilder/util/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._repo);

  final ResumeRepository _repo;

  List<Resume> resumes = [];
  bool isLoading = false;
  Exception? error;

  // ── Load ──────────────────────────────────────────────────────────────────

  Future<void> loadResumes(String uid) async {
    isLoading = true;
    error = null;
    notifyListeners();

    final result = await _repo.getResumes(uid);

    switch (result) {
      case Ok<List<Resume>>():
        resumes = result.value;
      case Error<List<Resume>>():
        error = result.error;
    }

    isLoading = false;
    notifyListeners();
  }

  // ── Delete ────────────────────────────────────────────────────────────────

  Future<bool> deleteResume(String uid, String resumeId) async {
    final result = await _repo.deleteResume(uid, resumeId);

    switch (result) {
      case Ok<void>():
        resumes = resumes.where((r) => r.id != resumeId).toList();
        notifyListeners();
        return true;
      case Error<void>():
        error = result.error;
        notifyListeners();
        return false;
    }
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}
