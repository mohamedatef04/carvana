import 'package:carvana/core/errors/failures.dart';
import 'package:carvana/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationsRepo {
  Future<void> notifyAllUsersNewCarAdded({
    required String carmodel,
    required String sellerName,
  });

  Future<Either<Failures, List<NotificationModel>>> getNotifications();

  Future<void> deleteNotification({required String notificationId});
}
