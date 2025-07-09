import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordForgotFirebaseService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  PasswordForgotFirebaseService(this._firestore, this._auth);

  /// Checks if phone exists in Firestore users collection
  Future<bool> formatAndVerifyPhoneNumber(String userInputPhone) async {
    final formattedPhone =
        '+216${userInputPhone.replaceAll(RegExp(r'[^\d]'), '')}';

    final query = await _firestore
        .collection('users')
        .where('phone', isEqualTo: formattedPhone)
        .limit(1)
        .get();

    return query.docs.isNotEmpty;
  }

  /// Sends verification SMS code to given E.164 phone number, returns verificationId
  Future<String> sendVerificationCode(String userInputPhone) async {
    final completer = Completer<String>();

    await _auth.verifyPhoneNumber(
      phoneNumber: userInputPhone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (_) {
        // No auto sign-in
      },
      verificationFailed: (e) => completer.completeError(e),
      codeSent: (verificationId, _) => completer.complete(verificationId),
      codeAutoRetrievalTimeout: (_) {},
    );

    return completer.future;
  }
}
