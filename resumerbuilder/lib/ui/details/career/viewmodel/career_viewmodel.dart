import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/career_entry/career_entry.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class CareerViewModel extends ChangeNotifier {
  CareerViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill values from existing draft ───────────────────────────────────

  CareerEntry? get existingEntry {
    final entries = _draftVm.draft.career;
    return entries.isNotEmpty ? entries.first : null;
  }

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({
    required String jobTitle,
    required String company,
    required String location,
    required String details,
    required String start,
    required String end,
  }) {
    if (!formKey.currentState!.validate()) return false;

    _draftVm.updateCareer([
      CareerEntry(
        jobTitle: jobTitle,
        company: company,
        location: location,
        details: details,
        start: start,
        end: end,
      ),
    ]);
    return true;
  }
}
