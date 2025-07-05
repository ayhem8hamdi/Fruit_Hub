import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class FireBaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn? _googleSignIn; // Nullable for web

  FireBaseAuthService(this._auth, this._firestore)
      : _googleSignIn = kIsWeb
            ? null
            : GoogleSignIn(
                scopes: ['email', 'profile'],
                // Client ID only needed for iOS
                clientId:
                    '33905260853-3bhcgcgvcdls2ooqno12coutrca0bqnv.apps.googleusercontent.com',
              );

  Future<User> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'fullName': fullName,
      'phone': phoneNumber,
      'createdAt': FieldValue.serverTimestamp(),
      'authProvider': 'email',
    });

    return userCredential.user!;
  }

  Future<User> loginUser({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        // New Web implementation using Firebase Auth directly
        final userCredential = await _auth.signInWithPopup(GoogleAuthProvider()
          ..addScope('email')
          ..addScope('profile'));

        final user = userCredential.user;
        if (user != null) await _updateUserData(user);
        return user;
      } else {
        if (_googleSignIn == null)
          throw Exception('GoogleSignIn not initialized for mobile');

        await _googleSignIn.signOut();
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return null;

        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        final user = userCredential.user;
        if (user != null) await _updateUserData(user, googleUser: googleUser);
        return user;
      }
    } catch (e) {
      rethrow; // Let the repository handle exceptions
    }
  }

  Future<void> _updateUserData(User user,
      {GoogleSignInAccount? googleUser}) async {
    final userRef = _firestore.collection('users').doc(user.uid);
    final userDoc = await userRef.get();

    final userData = {
      'email': user.email,
      'fullName': user.displayName ?? googleUser?.displayName,
      'phone': user.phoneNumber,
      'photoURL': user.photoURL ?? googleUser?.photoUrl,
      'updatedAt': FieldValue.serverTimestamp(),
      'authProvider': 'google',
    };

    if (!userDoc.exists) {
      userData['createdAt'] = FieldValue.serverTimestamp();
      await userRef.set(userData);
    } else {
      await userRef.update(userData);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    if (!kIsWeb && _googleSignIn != null) {
      await _googleSignIn.signOut();
    }
  }
}
