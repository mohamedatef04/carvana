import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/core/network/database_tables.dart';
import 'package:carvana/core/services/api_service.dart';
import 'package:carvana/core/services/notifications_service.dart';
import 'package:carvana/features/notifications/data/models/notification_model.dart';
import 'package:carvana/features/notifications/logic/repos/notifications_repo.dart';
import 'package:carvana/features/profile/data/models/user_data_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final ApiService apiService;

  NotificationsRepoImpl({required this.apiService});
  @override
  Future<void> notifyAllUsersNewCarAdded({
    required String carmodel,
    required String sellerName,
  }) async {
    try {
      final res = await apiService.getRequest(endpoint: usersTable);
      final List<UserDataModel> allUsers = (res.data as List)
          .map((e) => UserDataModel.fromJson(e))
          .toList();

      final List<Future<void>> futures = [];

      for (final user in allUsers) {
        final token = user.fcmToken;
        if (token != null && token.isNotEmpty) {
          futures.add(() async {
            try {
              final success = await NotificationsService.sendNotification(
                token,
                "🚗 New Car Added By $sellerName",
                "Check out the latest $carmodel listings now.",
              );

              // Clean up invalid token
              if (!success) {
                await apiService.updateRequest(
                  endpoint: '$usersTable?id=eq.${user.id}',
                  data: {'fcm_token': null},
                );
                print("Removed invalid token for user ${user.id}");
              }
            } catch (e) {
              print("Notification failed for user ${user.id}: $e");
            }
          }());
        }
      }

      // Wait for all notifications to complete
      await Future.wait(futures);

      // Store the notification in Supabase
      await apiService.postRequest(
        endpoint: notificationsTable,
        data: {
          'title': "🚗 New Car Added By $sellerName",
          'body': "Check out the latest $carmodel listings now.",
        },
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }

  @override
  Future<Either<Failures, List<NotificationModel>>> getNotifications() async {
    try {
      final res = await apiService.getRequest(endpoint: notificationsTable);

      List<dynamic> jsonData = res.data;
      List<NotificationModel> allNotifications = jsonData
          .map((e) => NotificationModel.fromJson(e))
          .toList();
      allNotifications.sort(
        (a, b) => DateTime.parse(b.time).compareTo(DateTime.parse(a.time)),
      );
      return Right(allNotifications);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioExeption(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<void> deleteNotification({required String notificationId}) async {
    try {
      await apiService.deleteRequest(
        endpoint: '$notificationsTable?id=eq.$notificationId',
      );
    } catch (e) {
      if (e is DioException) {
        throw ServerFailure.fromDioExeption(e);
      } else {
        throw ServerFailure(errorMessage: e.toString());
      }
    }
  }
}
