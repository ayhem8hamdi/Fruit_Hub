import 'package:cloud_firestore/cloud_firestore.dart';

class PasswordForgotFirebaseService {
  final FirebaseFirestore _firestore;

  PasswordForgotFirebaseService(this._firestore);

  Future<bool> formatAndVerifyPhoneNumber(String userInputPhone) async {
    final formattedPhone =
        '+216${userInputPhone.replaceAll(RegExp(r'[^\d]'), '')}';

    // Check Firestore for existence
    final query = await _firestore
        .collection('users')
        .where('phone', isEqualTo: formattedPhone)
        .limit(1)
        .get();

    return query.docs.isNotEmpty;
  }
}
