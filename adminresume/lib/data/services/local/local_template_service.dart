import 'dart:typed_data';
import 'package:adminresume/data/models/resume_template/resume_template.dart';
import 'package:flutter/material.dart';

class LocalTemplateService {
  LocalTemplateService._();
  static final LocalTemplateService instance = LocalTemplateService._();

  final List<ResumeTemplate> _templates = [
    ResumeTemplate(
      id: 't1',
      name: 'Classic',
      accentColor: Colors.black,
      isPopular: true,
      createdAt: DateTime(2024, 1, 1),
    ),
    ResumeTemplate(
      id: 't2',
      name: 'Modern',
      accentColor: Colors.indigo,
      isPopular: true,
      createdAt: DateTime(2024, 1, 15),
    ),
    ResumeTemplate(
      id: 't3',
      name: 'Creative',
      accentColor: Colors.teal,
      createdAt: DateTime(2024, 2, 1),
    ),
    ResumeTemplate(
      id: 't4',
      name: 'Professional',
      accentColor: Colors.deepPurple,
      createdAt: DateTime(2024, 2, 15),
    ),
    ResumeTemplate(
      id: 't5',
      name: 'Minimal',
      accentColor: Colors.blueGrey,
      createdAt: DateTime(2024, 3, 1),
    ),
    ResumeTemplate(
      id: 't6',
      name: 'Bold',
      accentColor: Colors.red,
      createdAt: DateTime(2024, 3, 15),
    ),
  ];

  int get templateCount => _templates.length;
  int _idCounter = 7;

  Future<List<ResumeTemplate>> getTemplates() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_templates);
  }

  Future<ResumeTemplate> addTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final saved = template.copyWith(
      id: 't${_idCounter++}',
      createdAt: DateTime.now(),
    );
    _templates.add(saved);
    return saved;
  }

  Future<void> updateTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _templates.indexWhere((t) => t.id == template.id);
    if (index >= 0) {
      _templates[index] = template;
    }
  }

  Future<void> deleteTemplate(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _templates.removeWhere((t) => t.id == id);
  }
}
