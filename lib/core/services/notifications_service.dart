import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class NotificationsService {
  static Future<String> getAccessToken() async {
    final Map<String, String> serviceAccountJson = {
      "type": "service_account",
      "project_id": "carvana-f84e1",
      "private_key_id": "a8986575a17d21e9f959b9ca326ac01d4407406f",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQClFAxEHmTr+mvy\ntzoUsDT28dwGK0ML+LjDkSYXxv2rs5hllXs5Wfo912PRfJK60QjqqyE/XfzpXAEs\nyU7I1ig74uT+RaerdH7f5T9jM6RqGlZPSihWqNxOL8JacPqp3CPOau8esqou6imL\ndw+Pdi05Wrywkso4OV5loaGnJ/0ppzlYI57kM3zRwRKhuFW30Rq4j6UZEGdrD4Ij\nU+j8OVRpiYa1ANaVn7I/WD2D3QfWC4xTgBLXD7Ro3QU/QK6x6jvhWE+h8HU16s3l\n1H/6qowS3uSG0jbs8c/jy5J1pFQNgfx5tf4NdE0eSzssUxbSo5IXbWL0wPWvR0qH\nO0Ed3IpjAgMBAAECggEAKdDHPqYYWHJJz+S78Kul7vvbCTECPdEWNGvbI2DDty+6\nJdlUqnVxXyLlZRZSMMJsqM0Kkfuj6hTlM0wXCea9sFXMPeC1FUhgLyTqBp35QutC\n+7jEORdzHtcYO0KtLEPYShxqT/NgCpxEQ9C3/1YnJIUokO3ODanykHn98dK+XUNX\nmTkg8vOsavFlKoHdYZKmYSIlGPggjrEZKZvuDe9ccz0Ea/ozu7MLxIi3ZMxwZfX+\neaeyGyLGZg7Fa5K1IRRqek0NVuCHVMfecMv8A9UlwEXaCDYNAht4pzx0+L4ADxNG\nngjLWs/r5hWX9QORowEqjmnmlBs90n1UfdfQguESMQKBgQDVit5QmCLK46jJaM3s\nwrsJIARWPvi5+nfv1sGsJTK0E5PWAMlWFOyMbpDlJd3He9NICeVdVZSy4lLh+D/1\nM4S+YQYvfP8it1rX1xEgiCOD8+RyCMVlYYbiv+LOETKxFliifd3+uBB0KyBBRssu\nOEEtzgbrc4olvsIUM+B4eLGu+wKBgQDF5mU1cAhBEkpPLR5JgfhC2mXsrn6aWgls\n2LqlLcrFvL9OdVooKKKf+Ed6NTJCnPRskmsjwFpOQwZgH1LAj0oIXppUwtKKCQG/\nXYqQz+HZ2i1QzAwHWF4ZlmA2kIhDDBUT9AzG0pJMmv/znGm4W6vRFi5N9gtnaAdl\nAGbSaUeVuQKBgQCteyXlH9OUNKOZDNXOtNyyKxqa3om+vWbWqAerTIUGmqkNwJHQ\npysNY32/S6YDO+uHqNJ3ouEs+oUPI1kCYRpEeBpIVioIECFzHDvDzBXeSzOaGNoU\n5MhqSi1976bZCyhyygKhvvNPDQIlRdgm8nixN6GTgsgGphSRyRthg9wGJQKBgHJ6\nh7t01mGGChRpHicZlxpdKi7S9gul3+PmL3oT1kOyntvtCL1IXGK7heWM1kkwcDhK\nLs4cnGC/ZvW9yOn5ObNDvnUfyhjtguRHYTvJ9XVHP4WIs8Cf/rdAhOGrlBds6tiD\nCc0NzHGiDEPJDGMILIkkEp8ooIot5HEp3VEEc9OJAoGAUs+G4qDNgUDFxND2IPPy\np8vm5iV/CwU1yoDPMtKgFzDgWyjovXI0ZbbvxURfeJC2BohjHtZv61Gf/82zzBBB\nkZtsr713x9jlDNf77aX54K1fO5gkTvAqILUeC7ZTWQoMI1xRiHBVVz021fP8hHq3\n7BICk9Tc/eI0fLm5qTXiB78=\n-----END PRIVATE KEY-----\n",
      "client_email": "notifications@carvana-f84e1.iam.gserviceaccount.com",
      "client_id": "106530446712795056712",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/notifications%40carvana-f84e1.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    auth.AccessCredentials credentials = await auth
        .obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
          scopes,
          client,
        );
    client.close();
    return credentials.accessToken.data;
  }

  static Future<bool> sendNotification(
    String deviceToken,
    String title,
    String body,
  ) async {
    final accessToken = await getAccessToken();
    const endpointFCM =
        'https://fcm.googleapis.com/v1/projects/carvana-f84e1/messages:send';

    final message = {
      "message": {
        "token": deviceToken,
        "notification": {
          "title": title,
          "body": body,
        },
        "data": {
          "route": "serviceScreen",
        },
        "android": {
          "priority": "high",
          "ttl": "3600s",
        },
      },
    };

    final response = await http.post(
      Uri.parse(endpointFCM),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      final body = jsonDecode(response.body);
      final error = body['error']?['status'] ?? '';
      print('Notification failed: $error');

      // Return false for known invalid token cases
      if (error == 'UNREGISTERED' ||
          error == 'INVALID_ARGUMENT' ||
          error == 'NOT_FOUND') {
        return false;
      }

      return true; // treat other failures as temporary
    }
  }
}
