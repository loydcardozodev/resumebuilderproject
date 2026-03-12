import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/config/photo_picker_box.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  File? _profileImage;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _jobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _websiteController = TextEditingController();
  final _statementController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Details')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            PhotoPickerBox(
              onImageSelected: (file) => setState(() => _profileImage = file),
            ),
            const SizedBox(height: 10),
            LabeledTextField(
              label: 'Full Name',
              hint: 'Enter full name',
              controller: _nameController,
            ),
            LabeledTextField(
              label: 'Email',
              hint: 'Enter email',
              controller: _emailController,
            ),
            LabeledTextField(
              label: 'Job Title',
              hint: 'Enter job title',
              controller: _jobController,
            ),
            LabeledTextField(
              label: 'Phone Number',
              hint: 'Enter phone number',
              controller: _phoneController,
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
              onNext: () => context.push(Routes.career),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
