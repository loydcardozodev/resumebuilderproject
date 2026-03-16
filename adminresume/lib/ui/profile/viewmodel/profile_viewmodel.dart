import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;
import 'dart:js_interop';

class AdminProfileViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  bool isUploading = false;
  String? errorMessage;

  AdminProfileViewModel() {
    _refreshUser();
  }

  Future<void> _refreshUser() async {
    await _auth.currentUser?.reload();
    notifyListeners();
  }

  User? get user => _auth.currentUser;

  String get displayName => user?.displayName ?? 'Admin';

  String get email {
    final e = user?.email;
    if (e != null && e.isNotEmpty) return e;
    return _auth.currentUser?.email ?? '';
  }

  String? get photoUrl => user?.photoURL;

  String get initials {
    final parts = displayName.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return parts[0].isNotEmpty ? parts[0][0].toUpperCase() : 'A';
  }

  Future<void> pickAndUploadPhoto() async {
    errorMessage = null;
    notifyListeners();

    try {
      // Create file input using package:web
      final input = web.document.createElement('input') as web.HTMLInputElement
        ..type = 'file'
        ..accept = 'image/png,image/jpeg,image/webp';

      // Completer to wait for file selection
      final completer = Completer<web.File?>();

      input.addEventListener(
        'change',
        (web.Event _) {
          final files = input.files;
          if (files != null && files.length > 0) {
            completer.complete(files.item(0));
          } else {
            completer.complete(null);
          }
        }.toJS,
      );

      // Trigger the picker
      input.click();

      final file = await completer.future;
      if (file == null) return;

      isUploading = true;
      notifyListeners();

      // Read file as bytes using FileReader + package:web
      final bytes = await _readFileAsBytes(file);

      final mimeType = file.type.isNotEmpty ? file.type : 'image/jpeg';
      final nameParts = file.name.split('.');
      final extension = nameParts.length > 1
          ? nameParts.last.toLowerCase()
          : 'jpg';

      final uid = user!.uid;
      final ref = _storage.ref().child('admin_avatars/$uid.$extension');

      await ref.putData(bytes, SettableMetadata(contentType: mimeType));

      final downloadUrl = await ref.getDownloadURL();
      await user!.updatePhotoURL(downloadUrl);
      await _auth.currentUser!.reload();
    } catch (e) {
      errorMessage = 'Failed to upload photo: $e';
    } finally {
      isUploading = false;
      notifyListeners();
    }
  }

  Future<Uint8List> _readFileAsBytes(web.File file) async {
    final completer = Completer<Uint8List>();
    final reader = web.FileReader();

    reader.addEventListener(
      'load',
      (web.Event _) {
        try {
          // readAsArrayBuffer result comes back as JSArrayBuffer
          final jsBuffer = reader.result as JSArrayBuffer;
          final byteBuffer = jsBuffer.toDart;
          completer.complete(Uint8List.view(byteBuffer));
        } catch (e) {
          completer.completeError('Failed to read file: $e');
        }
      }.toJS,
    );

    reader.addEventListener(
      'error',
      (web.Event _) {
        completer.completeError('FileReader error: ${reader.error?.message}');
      }.toJS,
    );

    // readAsArrayBuffer expects a web.Blob — web.File extends Blob so this works
    reader.readAsArrayBuffer(file as web.Blob);
    return completer.future;
  }
}
