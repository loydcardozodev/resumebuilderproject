import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/add_section.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class References extends StatelessWidget {
  const References({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('References')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const LabeledTextField(
              label: 'Reference Name',
              hint: 'Enter full name',
            ),
            const LabeledTextField(
              label: 'Job Title',
              hint: 'Enter their job title',
            ),
            const LabeledTextField(
              label: 'Company',
              hint: 'Enter their company',
            ),
            const LabeledTextField(label: 'Email', hint: 'Enter their email'),
            const LabeledTextField(
              label: 'Phone',
              hint: 'Enter their phone number',
            ),
            const AddSection(),
            const SizedBox(height: 10),
            NavButtons(
              onBack: () => context.go(Routes.interest),
              onNext: () => context.push(Routes.preview),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
