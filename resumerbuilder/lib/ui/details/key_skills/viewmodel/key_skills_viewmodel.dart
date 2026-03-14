import 'package:flutter/material.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class KeySkillsViewModel extends ChangeNotifier {
  KeySkillsViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  String get existingSkills => _draftVm.draft.keySkills.join(', ');

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({required String skills}) {
    if (!formKey.currentState!.validate()) return false;

    final list = skills
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    _draftVm.updateKeySkills(list);
    return true;
  }
}
