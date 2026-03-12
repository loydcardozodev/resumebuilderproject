import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/add_section.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Career extends StatelessWidget {
  const Career({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experience')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const LabeledTextField(label: 'Job Title', hint: 'Enter job title'),
            const LabeledTextField(label: 'Company', hint: 'Enter company'),
            const LabeledTextField(label: 'Location', hint: 'Enter location'),
            const LabeledTextField(label: 'Job Details', hint: 'Enter details'),
            Row(
              children: const [
                Expanded(
                  child: LabeledTextField(label: 'Start', hint: 'MM/YYYY'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: LabeledTextField(label: 'End', hint: 'MM/YYYY'),
                ),
              ],
            ),
            const AddSection(),
            const SizedBox(height: 10),
            NavButtons(
              onBack: () => context.go(Routes.personalData),
              onNext: () => context.push(Routes.education),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
