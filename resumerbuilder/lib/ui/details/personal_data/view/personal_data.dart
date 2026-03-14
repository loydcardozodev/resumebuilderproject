import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/config/photo_picker_box.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/personal_data/viewmodel/personal_data_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  late final PersonalDataViewModel _vm;

  // Controllers and file live in the View ✅
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _jobController;
  late final TextEditingController _phoneController;
  late final TextEditingController _addressController;
  late final TextEditingController _websiteController;
  late final TextEditingController _statementController;
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _vm = PersonalDataViewModel(context.read<ResumeDraftViewModel>());

    // Pre-fill from existing draft if user navigates back
    final info = _vm.existingInfo;
    _nameController      = TextEditingController(text: info.name);
    _emailController     = TextEditingController(text: info.email);
    _jobController       = TextEditingController(text: info.jobTitle);
    _phoneController     = TextEditingController(text: info.phone);
    _addressController   = TextEditingController(text: info.address);
    _websiteController   = TextEditingController(text: info.website);
    _statementController = TextEditingController(text: info.personalStatement);

    // Pre-fill photo if already picked
    if (info.photoPath != null) {
      _profileImage = File(info.photoPath!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _jobController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _websiteController.dispose();
    _statementController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(
      name:              _nameController.text.trim(),
      email:             _emailController.text.trim(),
      jobTitle:          _jobController.text.trim(),
      phone:             _phoneController.text.trim(),
      address:           _addressController.text.trim(),
      website:           _websiteController.text.trim(),
      personalStatement: _statementController.text.trim(),
      photoPath:         _profileImage?.path,
    );
    if (saved) context.push(Routes.career);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Details')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10),
          child: Column(
            children: [
              PhotoPickerBox(
                onImageSelected: (file) =>
                    setState(() => _profileImage = file),
              ),
              const SizedBox(height: 10),
              LabeledTextField(
                label: 'Full Name',
                hint: 'Enter full name',
                controller: _nameController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Full name is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Email',
                hint: 'Enter email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(v.trim())) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              LabeledTextField(
                label: 'Job Title',
                hint: 'Enter job title',
                controller: _jobController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Job title is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Phone Number',
                hint: 'Enter phone number',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Phone number is required'
                    : null,
              ),
              LabeledTextField(
                label: 'Address',
                hint: 'Enter address',
                controller: _addressController,
              ),
              LabeledTextField(
                label: 'Website',
                hint: 'https://yourwebsite.com',
                controller: _websiteController,
                keyboardType: TextInputType.url,
              ),
              LabeledTextField(
                label: 'Personal Statement',
                hint: 'Write a brief summary about yourself',
                controller: _statementController,
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              NavButtons(
                onBack: () => context.go(Routes.createtemp),
                onNext: _onNext,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}