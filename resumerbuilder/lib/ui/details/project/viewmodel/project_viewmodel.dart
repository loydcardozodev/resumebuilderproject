import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/project_entry/project_entry.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class ProjectViewModel extends ChangeNotifier {
  ProjectViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  ProjectEntry? get existingEntry {
    final entries = _draftVm.draft.projects;
    return entries.isNotEmpty ? entries.first : null;
  }

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({
    required String title,
    required String description,
    required String features,
    required String techUsed,
    required String githubLink,
    required String liveLink,
  }) {
    if (!formKey.currentState!.validate()) return false;

    _draftVm.updateProjects([
      ProjectEntry(
        title: title,
        description: description,
        features: features,
        techUsed: techUsed,
        githubLink: githubLink,
        liveLink: liveLink,
      ),
    ]);
    return true;
  }
}
