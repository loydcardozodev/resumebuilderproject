import 'package:flutter/material.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class InterestViewModel extends ChangeNotifier {
  InterestViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  String get existingInterests => _draftVm.draft.interests.join(', ');

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({required String hobbies}) {
    if (!formKey.currentState!.validate()) return false;

    // Split comma-separated string into a clean list
    final list = hobbies
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    _draftVm.updateInterests(list);
    return true;
  }
}
