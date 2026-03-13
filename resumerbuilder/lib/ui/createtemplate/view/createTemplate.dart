import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';
import 'package:resumerbuilder/routing/routes.dart';
import 'package:resumerbuilder/ui/createtemplate/viewmodel/template_viewmodel.dart';
import 'package:resumerbuilder/ui/viewmodel/resume_draft_viewmodel.dart';

class CreateTemplatePage extends StatefulWidget {
  const CreateTemplatePage({super.key});

  @override
  State<CreateTemplatePage> createState() => _CreateTemplatePageState();
}

class _CreateTemplatePageState extends State<CreateTemplatePage> {
  @override
  void initState() {
    super.initState();
    // Load templates on page open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TemplateViewModel>().loadTemplates();
    });
  }

  void _onCreateResume() {
    final selected = context.read<TemplateViewModel>().selected;
    if (selected == null) return;

    // Store selected template in resume draft
    context.read<ResumeDraftViewModel>().selectTemplate(selected.id);
    context.push(Routes.personalData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Resume'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer<TemplateViewModel>(
          builder: (context, vm, _) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.errorMessage != null) {
              return _ErrorState(
                message: vm.errorMessage!,
                onRetry: () => vm.loadTemplates(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _PreviewCard(selected: vm.selected),
                  const SizedBox(height: 24),
                  const Text(
                    'Choose a Template',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _TemplateList(
                    templates: vm.templates,
                    selected: vm.selected,
                    onSelect: vm.selectTemplate,
                  ),
                  const SizedBox(height: 24),
                  _CreateButton(
                    enabled: vm.selected != null,
                    onTap: _onCreateResume,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Preview Card ──────────────────────────────────────────────────────────────

class _PreviewCard extends StatelessWidget {
  final ResumeTemplate? selected;
  const _PreviewCard({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 420,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Accent bar reacts to selected template color
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              decoration: BoxDecoration(
                color: selected?.accentColor ?? Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      size: 52,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      selected != null
                          ? '${selected!.name} Template'
                          : 'Select a template',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Template List ─────────────────────────────────────────────────────────────

class _TemplateList extends StatelessWidget {
  final List<ResumeTemplate> templates;
  final ResumeTemplate? selected;
  final ValueChanged<ResumeTemplate> onSelect;

  const _TemplateList({
    required this.templates,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: templates.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final template = templates[index];
          return _TemplateItem(
            template: template,
            isSelected: selected?.id == template.id,
            onTap: () => onSelect(template),
          );
        },
      ),
    );
  }
}

class _TemplateItem extends StatelessWidget {
  final ResumeTemplate template;
  final bool isSelected;
  final VoidCallback onTap;

  const _TemplateItem({
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? template.accentColor : Colors.transparent,
            width: 2.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: template.accentColor.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Color swatch
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: template.accentColor,
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            const SizedBox(height: 6),
            Text(
              template.name,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (template.isPopular) ...[
              const SizedBox(height: 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Create Button ─────────────────────────────────────────────────────────────

class _CreateButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onTap;
  const _CreateButton({required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        child: const Text(
          'Create Resume',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ── Error State ───────────────────────────────────────────────────────────────

class _ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorState({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 52, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
