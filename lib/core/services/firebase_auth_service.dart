import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
        return _handleUserDataFromGoogle(userCredential.user);
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
        return _handleUserDataFromGoogle(userCredential.user,
            googleUser: googleUser);
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

  Future<User?> _handleUserDataFromGoogle(User? user,
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

  Future<User?> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile'],
    );

    switch (loginResult.status) {
      case LoginStatus.success:
        final accessToken = loginResult.accessToken!;
        final credential =
            FacebookAuthProvider.credential(accessToken.tokenString);
        final userCredential = await _auth.signInWithCredential(credential);

        final facebookUserData = await FacebookAuth.instance.getUserData();

        return _handleUserData(
          userCredential.user,
          facebookUserData: facebookUserData,
        );

      case LoginStatus.cancelled:
        return null;

      case LoginStatus.failed:
        throw PlatformException(
          code: 'FACEBOOK_LOGIN_FAILED',
          message: loginResult.message ?? 'Facebook login failed',
        );

      default:
        throw PlatformException(
          code: 'UNKNOWN_ERROR',
          message: 'Facebook login returned unknown status',
        );
    }
  }

  Future<User?> _handleUserData(
    User? user, {
    GoogleSignInAccount? googleUser,
    Map<String, dynamic>? facebookUserData,
  }) async {
    if (user == null) return null;

    final userDoc = _firestore.collection('users').doc(user.uid);
    final docSnapshot = await userDoc.get();

    await userDoc.set({
      'email': user.email,
      'fullName': user.displayName ??
          googleUser?.displayName ??
          facebookUserData?['name'],
      'phone': user.phoneNumber,
      'photoURL': user.photoURL ??
          googleUser?.photoUrl ??
          facebookUserData?['picture']?['data']?['url'],
      'authProvider': facebookUserData != null
          ? 'facebook'
          : googleUser != null
              ? 'google'
              : 'email',
      'updatedAt': FieldValue.serverTimestamp(),
      if (!docSnapshot.exists) 'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    return user;
  }
}
