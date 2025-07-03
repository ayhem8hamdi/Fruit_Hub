import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FireBaseAuthService(this._auth, this._firestore);

  Future<User> registerUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = userCredential.user!.uid;
    await _firestore.collection('users').doc(uid).set({
      'email': email,
      'fullName': fullName,
      'phone': phoneNumber,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return userCredential.user!;
  }
}
