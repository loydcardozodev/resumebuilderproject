import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resumerbuilder/data/models/resume_template/resume_template.dart';

class FirebaseTemplateService {
  FirebaseTemplateService({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<List<ResumeTemplate>> getTemplates() async {
    final snap = await _firestore.collection('templates').get();
    return snap.docs.map((d) => ResumeTemplate.fromJson(d.data())).toList();
  }

  Future<ResumeTemplate> getTemplateById(String id) async {
    final doc = await _firestore.collection('templates').doc(id).get();
    if (!doc.exists) throw Exception('Template $id not found.');
    return ResumeTemplate.fromJson(doc.data()!);
  }
}
