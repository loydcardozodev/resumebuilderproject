import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/key_skills/viewmodel/key_skills_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class KeySkills extends StatefulWidget {
  const KeySkills({super.key});

  @override
  State<KeySkills> createState() => _KeySkillsState();
}

class _KeySkillsState extends State<KeySkills> {
  late final KeySkillsViewModel _vm;

  // Controller lives in the View ✅
  late final TextEditingController _skillsController;

  @override
  void initState() {
    super.initState();
    _vm = KeySkillsViewModel(context.read<ResumeDraftViewModel>());
    _skillsController = TextEditingController(text: _vm.existingSkills);
  }

  @override
  void dispose() {
    _skillsController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(skills: _skillsController.text.trim());
    if (saved) context.push(Routes.projects);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Key Skills')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              LabeledTextField(
                label: 'List your skills',
                hint: 'e.g. Flutter, Firebase, REST API',
                controller: _skillsController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Please add at least one skill'
                    : null,
              ),
              const AddSection(),
              const SizedBox(height: 10),
              NavButtons(
                onBack: () => context.go(Routes.education),
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
