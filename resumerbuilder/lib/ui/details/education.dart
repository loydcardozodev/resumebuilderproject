import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/add_section.dart';
import 'package:resumerbuilder/ui/details/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const LabeledTextField(
              label: 'Education Institute',
              hint: 'Enter education institute',
            ),
            const LabeledTextField(
              label: 'Qualification',
              hint: 'Enter qualification',
            ),
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
              onBack: () => context.go(Routes.career),
              onNext: () => context.push(Routes.keySkills),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
