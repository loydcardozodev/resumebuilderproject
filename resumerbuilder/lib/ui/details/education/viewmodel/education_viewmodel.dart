import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/education_entry/education_entry.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class EducationViewModel extends ChangeNotifier {
  EducationViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  EducationEntry? get existingEntry {
    final entries = _draftVm.draft.education;
    return entries.isNotEmpty ? entries.first : null;
  }

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({
    required String institute,
    required String qualification,
    required String start,
    required String end,
  }) {
    if (!formKey.currentState!.validate()) return false;

    _draftVm.updateEducation([
      EducationEntry(
        institute: institute,
        qualification: qualification,
        start: start,
        end: end,
      ),
    ]);
    return true;
  }
}
