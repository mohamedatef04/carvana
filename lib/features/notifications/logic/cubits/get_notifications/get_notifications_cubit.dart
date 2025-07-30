import 'package:bloc/bloc.dart';
import 'package:carvana/features/notifications/data/models/notification_model.dart';
import 'package:carvana/features/notifications/logic/repos/notifications_repo.dart';
import 'package:equatable/equatable.dart';

part 'get_notifications_state.dart';

class GetNotificationsCubit extends Cubit<GetNotificationsState> {
  GetNotificationsCubit(this.notificationsRepo)
    : super(GetNotificationsInitial());

  final NotificationsRepo notificationsRepo;

  Future<void> getNotifications() async {
    emit(GetNotificationsLoading());
    final res = await notificationsRepo.getNotifications();
    res.fold((l) => emit(GetNotificationsError(errorMessage: l.errorMessage)), (
      r,
    ) {
      if (r.isEmpty) {
        emit(GetNotificationsEmpty());
      } else {
        emit(GetNotificationsSuccess(notificationsList: r));
      }
    });
  }

  Future<void> deleteNotification({required String notificationId}) async {
    try {
      await notificationsRepo.deleteNotification(
        notificationId: notificationId,
      );
      emit(NotifiacationDeletedSuccess());
    } on Exception catch (e) {
      emit(NotifiacationDeletedFailure(errorMessage: e.toString()));
    }
    final res = await notificationsRepo.getNotifications();
    res.fold((l) => emit(GetNotificationsError(errorMessage: l.errorMessage)), (
      r,
    ) {
      if (r.isEmpty) {
        emit(GetNotificationsEmpty());
      } else {
        emit(
          GetNotificationsSuccess(
            notificationsList: r.where((n) => n.id != notificationId).toList(),
          ),
        );
      }
    });
  }
}
