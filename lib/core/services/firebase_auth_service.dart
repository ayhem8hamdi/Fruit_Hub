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

  // ----------------------------
  // Google Sign-In
  // ----------------------------
  Future<User?> signInWithGoogle() async {
    try {
      final userCredential = kIsWeb
          ? await _signInWithGoogleWeb()
          : await _signInWithGoogleMobile();

      return _saveUserData(userCredential.user,
          googleUser: kIsWeb ? null : _googleSignIn?.currentUser);
    } catch (e) {
      throw _wrapAuthException(e, 'Google Sign-In failed');
    }
  }

  Future<UserCredential> _signInWithGoogleWeb() {
    final googleProvider = GoogleAuthProvider()
      ..addScope('email')
      ..addScope('profile');
    return _auth.signInWithPopup(googleProvider);
  }

  Future<UserCredential> _signInWithGoogleMobile() async {
    if (_googleSignIn == null) {
      throw PlatformException(
        code: 'INIT_ERROR',
        message: 'GoogleSignIn not initialized for this platform',
      );
    }

    await _googleSignIn.signOut(); // Clean previous session

    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw PlatformException(
          code: 'CANCELLED', message: 'User cancelled Google Sign-In');
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    return _auth.signInWithCredential(credential);
  }

  // ----------------------------
  // Facebook Sign-In
  // ----------------------------
  Future<User?> signInWithFacebook() async {
    try {
      if (kIsWeb) {
        await FacebookAuth.i.webAndDesktopInitialize(
          appId: '1262583735375266',
          cookie: true,
          xfbml: true,
          version: 'v23.0',
        );
      }

      // Check if already logged in
      final existingAccessToken = await FacebookAuth.instance.accessToken;
      if (existingAccessToken != null) {
        // Logout first to avoid token conflict
        await FacebookAuth.instance.logOut();
      }

      final result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status != LoginStatus.success) {
        if (result.status == LoginStatus.cancelled) return null;
        throw PlatformException(
          code: 'FACEBOOK_LOGIN_FAILED',
          message: result.message ?? 'Facebook login failed',
        );
      }

      final accessToken = result.accessToken!;
      final credential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      final userCredential = await _auth.signInWithCredential(credential);

      final facebookUserData = await FacebookAuth.instance.getUserData();
      return _saveUserData(
        userCredential.user,
        facebookUserData: facebookUserData,
      );
    } catch (e) {
      throw _wrapAuthException(e, 'Facebook Sign-In failed');
    }
  }

  // ----------------------------
  // Email/Password Authentication
  // ----------------------------
  Future<User> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    final formattedPhone =
        '+216${phoneNumber.replaceAll(RegExp(r'[^\d]'), '')}';

    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'fullName': fullName,
      'phone': formattedPhone,
      'authProvider': 'email',
      'createdAt': FieldValue.serverTimestamp(),
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

  // ----------------------------
  // User Data Management
  // ----------------------------
  Future<User?> _saveUserData(
    User? user, {
    GoogleSignInAccount? googleUser,
    Map<String, dynamic>? facebookUserData,
  }) async {
    if (user == null) return null;

    final userDoc = _firestore.collection('users').doc(user.uid);
    final isNewUser = !(await userDoc.get()).exists;

    await userDoc.set({
      'email': user.email,
      'fullName': user.displayName ??
          googleUser?.displayName ??
          facebookUserData?['name'],
      'phone': user.phoneNumber,
      'photoURL': user.photoURL ??
          googleUser?.photoUrl ??
          facebookUserData?['picture']?['data']?['url'],
      'authProvider': facebookUserData != null ? 'facebook' : 'google',
      'updatedAt': FieldValue.serverTimestamp(),
      if (isNewUser) 'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    return user;
  }

  // ----------------------------
  // Error Handling
  // ----------------------------
  PlatformException _wrapAuthException(Object e, String fallbackMessage) {
    if (e is FirebaseAuthException) {
      return PlatformException(
          code: e.code, message: e.message ?? fallbackMessage);
    } else if (e is PlatformException) {
      return e;
    } else {
      return PlatformException(
          code: 'UNKNOWN_ERROR', message: '$fallbackMessage: ${e.toString()}');
    }
  }
}
