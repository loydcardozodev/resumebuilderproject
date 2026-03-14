import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Project extends StatelessWidget {
  const Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project')),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            const LabeledTextField(
              label: 'Project Title',
              hint: 'Enter project title',
            ),
            const LabeledTextField(
              label: 'Project Description',
              hint: 'Enter project description',
              maxLines: 3,
            ),
            const LabeledTextField(
              label: 'Project Features',
              hint: 'Enter project features',
              maxLines: 3,
            ),
            const AddSection(),
            const SizedBox(height: 10),
            const LabeledTextField(
              label: 'Technology Used',
              hint: 'e.g. Flutter, Firebase, REST API',
            ),
            const LabeledTextField(
              label: 'GitHub Link',
              hint: 'https://github.com/username/repo',
            ),
            const LabeledTextField(
              label: 'Live Link',
              hint: 'https://yourapp.com',
            ),
            const AddSection(),
            const SizedBox(height: 10),
            NavButtons(
              onBack: () => context.go(Routes.keySkills),
              onNext: () => context.push(Routes.interest),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
