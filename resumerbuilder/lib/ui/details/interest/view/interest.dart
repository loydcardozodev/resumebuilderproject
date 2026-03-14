import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/details/interest/viewmodel/interest_viewmodel.dart';
import 'package:resumerbuilder/ui/details/widget/add_section.dart';
import 'package:resumerbuilder/ui/details/widget/customdrawer.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';
import 'package:resumerbuilder/ui/widget/labeled_text_field.dart';
import 'package:resumerbuilder/ui/widget/nav_buttons.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  late final InterestViewModel _vm;

  // Controller lives in the View ✅
  late final TextEditingController _hobbiesController;

  @override
  void initState() {
    super.initState();
    _vm = InterestViewModel(context.read<ResumeDraftViewModel>());
    _hobbiesController = TextEditingController(text: _vm.existingInterests);
  }

  @override
  void dispose() {
    _hobbiesController.dispose();
    super.dispose();
  }

  void _onNext() {
    final saved = _vm.saveToResumeDraft(
      hobbies: _hobbiesController.text.trim(),
    );
    if (saved) context.push(Routes.references);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interests')),
      drawer: const CustomDrawer(),
      body: Form(
        key: _vm.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              LabeledTextField(
                label: 'List your hobbies',
                hint: 'e.g. Reading, Travelling, Photography',
                controller: _hobbiesController,
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Please add at least one hobby'
                    : null,
              ),
              const AddSection(),
              const SizedBox(height: 10),
              NavButtons(
                onBack: () => context.go(Routes.projects),
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
