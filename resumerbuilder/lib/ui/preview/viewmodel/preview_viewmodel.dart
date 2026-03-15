import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/repository/resume_repository/resume_repository.dart';
import 'package:resumerbuilder/util/command.dart';
import 'package:resumerbuilder/util/result.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class ResumePreviewViewModel extends ChangeNotifier {
  ResumePreviewViewModel({
    required ResumeDraftViewModel draftViewModel,
    required ResumeRepository resumeRepository,
  }) : _draftViewModel = draftViewModel,
       _resumeRepository = resumeRepository {
    downloadPdf = Command0(_downloadPdf);
    saveDraft = Command1(_saveDraft);
  }

  final ResumeDraftViewModel _draftViewModel;
  final ResumeRepository _resumeRepository;

  static const List<Color> themeColors = [
    Colors.black,
    Colors.indigo,
    Colors.teal,
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.brown,
  ];

  int _selectedThemeIndex = 0;

  int get selectedThemeIndex => _selectedThemeIndex;
  Color get selectedColor => themeColors[_selectedThemeIndex];
  ResumeDraftViewModel get draft => _draftViewModel;

  // ── Commands ──────────────────────────────────────────────────────────────

  late final Command0<void> downloadPdf;
  late final Command1<void, String> saveDraft;

  // ── Actions ───────────────────────────────────────────────────────────────

  void selectTheme(int index) {
    if (index < 0 || index >= themeColors.length) return;
    _selectedThemeIndex = index;
    notifyListeners();
  }

  Future<Result<void>> _downloadPdf() async {
    try {
      // Replace with real PDF generation logic
      await Future.delayed(const Duration(seconds: 2));
      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> _saveDraft(String uid) async {
    try {
      final success = await _draftViewModel.saveDraft(uid);
      if (success) return const Result.ok(null);
      return Result.error(Exception(_draftViewModel.errorMessage));
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
