part of 'get_notifications_cubit.dart';

abstract class GetNotificationsState extends Equatable {
  const GetNotificationsState();

  @override
  List<Object> get props => [];
}

class GetNotificationsInitial extends GetNotificationsState {}

class GetNotificationsLoading extends GetNotificationsState {}

class GetNotificationsEmpty extends GetNotificationsState {}

class GetNotificationsSuccess extends GetNotificationsState {
  final List<NotificationModel> notificationsList;
  const GetNotificationsSuccess({required this.notificationsList});
}

class GetNotificationsError extends GetNotificationsState {
  final String errorMessage;
  const GetNotificationsError({required this.errorMessage});
}

class NotifiacationDeletedSuccess extends GetNotificationsState {}

class NotifiacationDeletedFailure extends GetNotificationsState {
  final String errorMessage;
  const NotifiacationDeletedFailure({required this.errorMessage});
}
