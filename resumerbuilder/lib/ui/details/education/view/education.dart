import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/education/viewmodel/education_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  late final EducationViewModel _vm;

  // Controllers live in the View ✅
  late final TextEditingController _instituteController;
  late final TextEditingController _qualificationController;
  late final TextEditingController _startController;
  late final TextEditingController _endController;

  @override
  void initState() {
    super.initState();
    _vm = EducationViewModel(context.read<ResumeDraftViewModel>());

    // Pre-fill from existing draft if user navigates back
    final entry = _vm.existingEntry;
    _instituteController     = TextEditingController(text: entry?.institute     ?? '');
    _qualificationController = TextEditingController(text: entry?.qualification ?? '');
    _startController         = TextEditingController(text: entry?.start         ?? '');
    _endController           = TextEditingController(text: entry?.end           ?? '');
  }

  @override
  void dispose() {
    _instituteController.dispose();
    _qualificationController.dispose();
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(
      institute:     _instituteController.text.trim(),
      qualification: _qualificationController.text.trim(),
      start:         _startController.text.trim(),
      end:           _endController.text.trim(),
    );
    if (saved) context.push(Routes.keySkills);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              LabeledTextField(
                label: 'Education Institute',
                hint: 'Enter education institute',
                controller: _instituteController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Institute is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Qualification',
                hint: 'Enter qualification',
                controller: _qualificationController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Qualification is required'
                    : null,
              ),
              Row(
                children: [
                  Expanded(
                    child: LabeledTextField(
                      label: 'Start',
                      hint: 'MM/YYYY',
                      controller: _startController,
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Start date is required'
                          : null,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: LabeledTextField(
                      label: 'End',
                      hint: 'MM/YYYY',
                      controller: _endController,
                    ),
                  ),
                ],
              ),
              const AddSection(),
              const SizedBox(height: 10),
              NavButtons(
                onBack: () => context.go(Routes.career),
                onNext: _onNext,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}