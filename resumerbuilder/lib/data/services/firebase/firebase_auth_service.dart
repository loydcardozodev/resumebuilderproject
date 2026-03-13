import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:resumerbuilder/data/models/app_user/app_user.dart';

class FirebaseAuthService {
  FirebaseAuthService({
    firebase.FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  }) : _auth = auth ?? firebase.FirebaseAuth.instance,
       _firestore = firestore ?? FirebaseFirestore.instance;

  final firebase.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  // ── Private Helpers ───────────────────────────────────────────────────────

  AppUser _mapUser(firebase.User user, {String? name}) {
    return AppUser(
      uid: user.uid,
      name: name ?? user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  Future<String?> _fetchName(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      return doc.data()?['name'] as String?;
    } catch (_) {
      return null;
    }
  }

  // ── Public API ────────────────────────────────────────────────────────────

  /// Returns the current signed-in user with name from Firestore.
  /// Returns null if no user is signed in.
  Future<AppUser?> get currentUser async {
    final user = _auth.currentUser;
    if (user == null) return null;
    final name = await _fetchName(user.uid);
    return _mapUser(user, name: name);
  }

  /// Emits a new [AppUser] whenever auth state changes.
  Stream<AppUser?> get authStateChanges {
    return _auth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;
      final name = await _fetchName(user.uid);
      return _mapUser(user, name: name);
    });
  }

  /// Signs in with email and password.
  Future<AppUser> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;
    final name = await _fetchName(user.uid);
    return _mapUser(user, name: name);
  }

  /// Creates a Firebase Auth account AND writes the user doc to Firestore.
  Future<AppUser> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = credential.user!;

    await user.updateDisplayName(name);

    // Write user doc so _fetchName works for all future sessions.
    await _firestore.collection('users').doc(user.uid).set({
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return _mapUser(user, name: name);
  }

  /// Updates name and email in both Firebase Auth and Firestore.
  Future<void> updateProfile({
    required String uid,
    required String name,
    required String email,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await Future.wait([
      user.updateDisplayName(name),
      user.verifyBeforeUpdateEmail(email),
      _firestore.collection('users').doc(uid).update({
        'name': name,
        'email': email,
      }),
    ]);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  /// Deletes the Firebase Auth account and the Firestore user doc.
  Future<void> deleteAccount(String uid) async {
    await Future.wait([
      _firestore.collection('users').doc(uid).delete(),
      _auth.currentUser!.delete(),
    ]);
  }
}
