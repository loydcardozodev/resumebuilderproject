import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/add_section.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class KeySkills extends StatelessWidget {
  const KeySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Key Skills')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const LabeledTextField(
              label: 'List your skills',
              hint: 'Enter your skills',
            ),
            const AddSection(),
            const SizedBox(height: 10),
            NavButtons(
              onBack: () => context.go(Routes.education),
              onNext: () => context.push(Routes.projects),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
