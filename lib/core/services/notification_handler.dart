import 'package:supabase_flutter/supabase_flutter.dart';
import 'notifications_service.dart';

Future<void> notifyAllUsersNewCarAdded() async {
  final currentUserId = Supabase.instance.client.auth.currentUser?.id;

  final response = await Supabase.instance.client
      .from('users')
      .select('fcm_token, id')
      .neq('id', currentUserId!);

  final List users = response;
  for (final user in users) {
    final token = user['fcm_token'];
    print("Trying to send to token: $token");
    if (token != null && token.toString().isNotEmpty) {
      await NotificationsService.sendNotification(
        token,
        "🚗 New Car Added!",
        "Check out the latest car listings now.",
      );
    }
  }
}
