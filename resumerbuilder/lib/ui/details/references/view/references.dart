import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/references/viewmodel/references_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class References extends StatefulWidget {
  const References({super.key});

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  late final ReferencesViewModel _vm;

  // Controllers live in the View ✅
  late final TextEditingController _nameController;
  late final TextEditingController _jobTitleController;
  late final TextEditingController _companyController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _vm = ReferencesViewModel(context.read<ResumeDraftViewModel>());

    // Pre-fill from existing draft if user navigates back
    final entry = _vm.existingEntry;
    _nameController = TextEditingController(text: entry?.name ?? '');
    _jobTitleController = TextEditingController(text: entry?.jobTitle ?? '');
    _companyController = TextEditingController(text: entry?.company ?? '');
    _emailController = TextEditingController(text: entry?.email ?? '');
    _phoneController = TextEditingController(text: entry?.phone ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _companyController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(
      name: _nameController.text.trim(),
      jobTitle: _jobTitleController.text.trim(),
      company: _companyController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
    );
    if (saved) context.push(Routes.preview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('References')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              LabeledTextField(
                label: 'Reference Name',
                hint: 'Enter full name',
                controller: _nameController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Reference name is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Job Title',
                hint: 'Enter their job title',
                controller: _jobTitleController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Job title is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Company',
                hint: 'Enter their company',
                controller: _companyController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Company is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Email',
                hint: 'Enter their email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(
                    r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(v.trim())) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              LabeledTextField(
                label: 'Phone',
                hint: 'Enter their phone number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              const AddSection(),
              const SizedBox(height: 10),
              NavButtons(
                onBack: () => context.go(Routes.interest),
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
