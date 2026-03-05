import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/config/photo_picker_box.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  File? _profileImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController personalStatementController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    jobController.dispose();
    phoneController.dispose();
    addressController.dispose();
    websiteController.dispose();
    personalStatementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal details')),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              PhotoPickerBox(
                onImageSelected: (file) {
                  _profileImage = file;
                },
              ),

              const SizedBox(height: 10),

              _buildLabel("Full Name"),
              _buildTextField("Enter Full Name", controller: nameController),

              const SizedBox(height: 10),

              _buildLabel("Email"),
              _buildTextField("Enter Email", controller: emailController),

              const SizedBox(height: 10),

              _buildLabel("Job Title"),
              _buildTextField("Enter job title", controller: jobController),

              const SizedBox(height: 10),

              _buildLabel("Phone Number"),
              _buildTextField("Enter number", controller: phoneController),

              const SizedBox(height: 10),

              _buildLabel("Address"),
              _buildTextField("Enter address", controller: addressController),

              const SizedBox(height: 10),

              _buildLabel("Website"),
              _buildTextField("Enter website", controller: websiteController),

              const SizedBox(height: 10),

              _buildLabel("Personal Statement"),
              _buildTextField(
                "Enter personal statement",
                controller: personalStatementController,
                maxLines: 3,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.go(Routes.createtemp);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.push(Routes.career);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
