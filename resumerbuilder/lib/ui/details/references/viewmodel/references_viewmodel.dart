import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/reference_entry/reference_entry.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class ReferencesViewModel extends ChangeNotifier {
  ReferencesViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  ReferenceEntry? get existingEntry {
    final entries = _draftVm.draft.references;
    return entries.isNotEmpty ? entries.first : null;
  }

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({
    required String name,
    required String jobTitle,
    required String company,
    required String email,
    required String phone,
  }) {
    if (!formKey.currentState!.validate()) return false;

    _draftVm.updateReferences([
      ReferenceEntry(
        name: name,
        jobTitle: jobTitle,
        company: company,
        email: email,
        phone: phone,
      ),
    ]);
    return true;
  }
}
