import 'package:bloc/bloc.dart';
import 'package:carvana/features/notifications/logic/repos/notifications_repo.dart';
import 'package:equatable/equatable.dart';

part 'send_notification_to_all_users_state.dart';

class SendNotificationToAllUsersCubit
    extends Cubit<SendNotificationToAllUsersState> {
  SendNotificationToAllUsersCubit(this.notificationsRepo)
    : super(SendNotificationToAllUsersInitial());

  final NotificationsRepo notificationsRepo;

  Future<void> sendNotificationToAllUsers({
    required String carmodel,
    required String sellerName,
  }) async {
    try {
      await notificationsRepo.notifyAllUsersNewCarAdded(
        carmodel: carmodel,
        sellerName: sellerName,
      );
      emit(SendNotificationToAllUsersSuccess());
    } catch (e) {
      emit(SendNotificationToAllUsersFailure(errorMessage: e.toString()));
    }
  }
}
