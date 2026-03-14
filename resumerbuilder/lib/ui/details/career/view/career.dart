import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/career/viewmodel/career_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Career extends StatefulWidget {
  const Career({super.key});

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  late final CareerViewModel _vm;

  late final TextEditingController _jobTitleController;
  late final TextEditingController _companyController;
  late final TextEditingController _locationController;
  late final TextEditingController _detailsController;
  late final TextEditingController _startController;
  late final TextEditingController _endController;

  @override
  void initState() {
    super.initState();
    _vm = CareerViewModel(context.read<ResumeDraftViewModel>());

    // Pre-fill from existing draft if user navigates back
    final entry = _vm.existingEntry;
    _jobTitleController = TextEditingController(text: entry?.jobTitle ?? '');
    _companyController = TextEditingController(text: entry?.company ?? '');
    _locationController = TextEditingController(text: entry?.location ?? '');
    _detailsController = TextEditingController(text: entry?.details ?? '');
    _startController = TextEditingController(text: entry?.start ?? '');
    _endController = TextEditingController(text: entry?.end ?? '');
  }

  @override
  void dispose() {
    _jobTitleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _detailsController.dispose();
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(
      jobTitle: _jobTitleController.text.trim(),
      company: _companyController.text.trim(),
      location: _locationController.text.trim(),
      details: _detailsController.text.trim(),
      start: _startController.text.trim(),
      end: _endController.text.trim(),
    );
    if (saved) context.push(Routes.education);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              LabeledTextField(
                label: 'Job Title',
                hint: 'Enter job title',
                controller: _jobTitleController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Job title is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Company',
                hint: 'Enter company',
                controller: _companyController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Company is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Location',
                hint: 'Enter location',
                controller: _locationController,
              ),
              LabeledTextField(
                label: 'Job Details',
                hint: 'Enter details',
                controller: _detailsController,
                maxLines: 3,
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
                onBack: () => context.go(Routes.personalData),
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
