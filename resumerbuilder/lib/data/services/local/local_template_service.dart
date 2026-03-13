import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';

class LocalTemplateService {
  LocalTemplateService._();
  static final LocalTemplateService instance = LocalTemplateService._();

  static final List<ResumeTemplate> _templates = [
    const ResumeTemplate(
      id: 't1',
      name: 'Classic',
      accentColor: Colors.black,
      isPopular: true,
    ),
    const ResumeTemplate(
      id: 't2',
      name: 'Modern',
      accentColor: Colors.indigo,
      isPopular: true,
    ),
    const ResumeTemplate(id: 't3', name: 'Creative', accentColor: Colors.teal),
    const ResumeTemplate(
      id: 't4',
      name: 'Professional',
      accentColor: Colors.deepPurple,
    ),
    const ResumeTemplate(
      id: 't5',
      name: 'Minimal',
      accentColor: Colors.blueGrey,
    ),
    const ResumeTemplate(id: 't6', name: 'Bold', accentColor: Colors.red),
    const ResumeTemplate(id: 't7', name: 'Elegant', accentColor: Colors.brown),
    const ResumeTemplate(id: 't8', name: 'Sharp', accentColor: Colors.orange),
  ];

  Future<List<ResumeTemplate>> getTemplates() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_templates);
  }

  Future<ResumeTemplate> getTemplateById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _templates.firstWhere((t) => t.id == id);
    } catch (_) {
      throw Exception('Template $id not found.');
    }
  }
}
