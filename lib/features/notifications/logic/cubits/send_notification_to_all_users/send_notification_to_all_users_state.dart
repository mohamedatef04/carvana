part of 'send_notification_to_all_users_cubit.dart';

abstract class SendNotificationToAllUsersState extends Equatable {
  const SendNotificationToAllUsersState();

  @override
  List<Object> get props => [];
}

class SendNotificationToAllUsersInitial
    extends SendNotificationToAllUsersState {}

class SendNotificationToAllUsersSuccess
    extends SendNotificationToAllUsersState {}

class SendNotificationToAllUsersFailure
    extends SendNotificationToAllUsersState {
  final String errorMessage;

  const SendNotificationToAllUsersFailure({required this.errorMessage});
}
