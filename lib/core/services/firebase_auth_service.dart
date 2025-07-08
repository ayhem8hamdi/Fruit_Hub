import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;
import 'package:flutter/services.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn? _googleSignIn;

  FireBaseAuthService(this._auth, this._firestore)
      : _googleSignIn = kIsWeb
            ? null
            : GoogleSignIn(
                signInOption: SignInOption.standard,
                scopes: ['email', 'profile'],
                clientId: defaultTargetPlatform == TargetPlatform.iOS
                    ? '33905260853-3bhcgcgvcdls2ooqno12coutrca0bqnv.apps.googleusercontent.com'
                    : null,
              );

  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final userCredential = await _auth.signInWithPopup(GoogleAuthProvider()
          ..addScope('email')
          ..addScope('profile'));
        return _handleUserData(userCredential.user);
      } else {
        if (_googleSignIn == null) {
          throw PlatformException(
              code: 'INIT_ERROR',
              message: 'GoogleSignIn not initialized for this platform');
        }

        // Clear previous sessions
        await _googleSignIn.signOut();

        // Trigger Google Sign-In flow
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return null;

        // Get authentication tokens
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // Sign into Firebase
        final userCredential = await _auth.signInWithCredential(credential);
        return _handleUserData(userCredential.user, googleUser: googleUser);
      }
    } on FirebaseAuthException catch (e) {
      throw PlatformException(
          code: e.code, message: e.message ?? 'Firebase authentication failed');
    } catch (e) {
      throw PlatformException(
          code: 'UNKNOWN_ERROR',
          message: 'Google Sign-In failed: ${e.toString()}');
    }
  }

  Future<User?> _handleUserData(User? user,
      {GoogleSignInAccount? googleUser}) async {
    if (user == null) return null;

    await _firestore.collection('users').doc(user.uid).set({
      'email': user.email,
      'fullName': user.displayName ?? googleUser?.displayName,
      'phone': user.phoneNumber,
      'photoURL': user.photoURL ?? googleUser?.photoUrl,
      'authProvider': 'google',
      'updatedAt': FieldValue.serverTimestamp(),
      if (!(await _firestore.collection('users').doc(user.uid).get()).exists)
        'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    return user;
  }

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
}
