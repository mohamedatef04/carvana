import 'package:intl/intl.dart';

String timeAgoforNotification(String rawTimestamp) {
  try {
    final utcTime = DateTime.parse(rawTimestamp);
    final localTime = utcTime.toLocal();
    final now = DateTime.now();
    final diff = now.difference(localTime);

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return DateFormat('MMM d, yyyy').format(localTime);
  } catch (e) {
    return ''; // or return rawTimestamp if you prefer
  }
}
