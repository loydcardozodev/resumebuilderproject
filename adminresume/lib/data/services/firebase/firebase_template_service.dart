import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:adminresume/data/models/resume_template/resume_template.dart';

class FirebaseTemplateService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  static const _col = 'templates';

  Future<List<ResumeTemplate>> getTemplates() async {
    final snap = await _db
        .collection(_col)
        .orderBy('createdAt', descending: true)
        .get();
    return snap.docs
        .map((d) => ResumeTemplate.fromMap(d.id, d.data()))
        .toList();
  }

  Future<ResumeTemplate> addTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    String? thumbnailUrl;
    if (thumbnailBytes != null && fileName != null) {
      thumbnailUrl = await _uploadThumbnail(
        template.id,
        thumbnailBytes,
        fileName,
      );
    }
    final toSave = thumbnailUrl != null
        ? template.copyWith(thumbnailUrl: thumbnailUrl)
        : template;
    final ref = await _db.collection(_col).add(toSave.toMap());
    return toSave.copyWith(id: ref.id);
  }

  Future<void> updateTemplate(
    ResumeTemplate template, {
    Uint8List? thumbnailBytes,
    String? fileName,
  }) async {
    String? thumbnailUrl;
    if (thumbnailBytes != null && fileName != null) {
      thumbnailUrl = await _uploadThumbnail(
        template.id,
        thumbnailBytes,
        fileName,
      );
    }
    final toSave = thumbnailUrl != null
        ? template.copyWith(thumbnailUrl: thumbnailUrl)
        : template;
    await _db.collection(_col).doc(template.id).update(toSave.toMap());
  }

  Future<void> deleteTemplate(String id) async {
    await _db.collection(_col).doc(id).delete();
    try {
      await _storage.ref('thumbnails/$id').delete();
    } catch (_) {}
  }

  Future<String> _uploadThumbnail(
    String id,
    Uint8List bytes,
    String fileName,
  ) async {
    final ref = _storage.ref('thumbnails/$id/$fileName');
    await ref.putData(bytes);
    return await ref.getDownloadURL();
  }
}
