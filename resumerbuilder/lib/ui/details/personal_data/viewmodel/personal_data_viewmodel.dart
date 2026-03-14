import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/personal_info/personal_info.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class PersonalDataViewModel extends ChangeNotifier {
  PersonalDataViewModel(this._draftVm);

  final ResumeDraftViewModel _draftVm;
  final formKey = GlobalKey<FormState>();

  // ── Pre-fill from existing draft ──────────────────────────────────────────

  PersonalInfo get existingInfo => _draftVm.draft.personalInfo;

  // ── Save to draft ─────────────────────────────────────────────────────────

  bool saveToResumeDraft({
    required String name,
    required String email,
    required String jobTitle,
    required String phone,
    required String address,
    required String website,
    required String personalStatement,
    String? photoPath,
  }) {
    if (!formKey.currentState!.validate()) return false;

    _draftVm.updatePersonalInfo(
      PersonalInfo(
        name: name,
        email: email,
        jobTitle: jobTitle,
        phone: phone,
        address: address,
        website: website,
        personalStatement: personalStatement,
        photoPath: photoPath,
      ),
    );
    return true;
  }
}
