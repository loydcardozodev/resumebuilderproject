import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:resumerbuilder/data/models/app_user/app_user.dart';

class FirebaseProfileService {
  FirebaseProfileService({
    firebase.FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  }) : _auth = auth ?? firebase.FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  final firebase.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<AppUser?> getProfile(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return AppUser.fromJson(doc.data()!);
  }

  Future<void> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await Future.wait([
      user.updateDisplayName(name),
      _firestore.collection('users').doc(uid).update({
        'name': name,
        'email': email,
      }),
    ]);

    // Only send verification email if email actually changed
    if (user.email != email) {
      await user.verifyBeforeUpdateEmail(email);
    }
  }

  Future<void> updatePhoto({
    required String uid,
    required String photoUrl,
  }) async {
    await Future.wait([
      _auth.currentUser!.updatePhotoURL(photoUrl),
      _firestore.collection('users').doc(uid).update({'photoUrl': photoUrl}),
    ]);
  }
}
