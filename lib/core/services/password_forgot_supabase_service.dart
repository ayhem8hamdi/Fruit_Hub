import 'package:supabase_flutter/supabase_flutter.dart';

class PasswordForgotService {
  final SupabaseClient _client;
  PasswordForgotService(this._client);

  Future<String?> getEmailFromPhone(String phoneNumber) async {
    final formattedPhone = _formatPhoneNumber(phoneNumber);
    final response = await _client
        .from('profiles')
        .select('email')
        .eq('phone', formattedPhone)
        .maybeSingle();

    if (response != null && response['email'] != null) {
      return response['email'] as String;
    }

    return null;
  }

  String _formatPhoneNumber(String phoneNumber) {
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return '+216$digitsOnly';
  }
}
