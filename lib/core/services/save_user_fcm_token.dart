import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> saveUserFcmToken() async {
  final userId = Supabase.instance.client.auth.currentUser?.id;

  try {
    String? token;

    // Retry a few times if token is null
    int retry = 0;
    while (token == null && retry < 5) {
      token = await FirebaseMessaging.instance.getToken();
      print('🔁 Retry #$retry: Token = $token');
      await Future.delayed(const Duration(seconds: 1));
      retry++;
    }

    if (token == null) {
      print('❌ Failed to get FCM token after retries');
      return;
    }

    print("✅ FCM Token: $token");

    // Only update if user is logged in
    if (userId != null) {
      await Supabase.instance.client
          .from('users')
          .update({'fcm_token': token})
          .eq('id', userId);
      print('✅ Token saved to Supabase for user $userId');
    } else {
      print("ℹ️ Token fetched, but no user logged in yet.");
    }
  } catch (e) {
    print("❌ Error saving FCM token: $e");
  }
}
