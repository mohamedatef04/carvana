import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:carvana/features/notifications/logic/cubits/get_notifications/get_notifications_cubit.dart';
import 'package:carvana/features/notifications/ui/widgets/notifications_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  static const routeName = '/notifications-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetNotificationsCubit(getIt.get<NotificationsRepoImpl>()),
      child: const Scaffold(body: NotificationsViewBody()),
    );
  }
}
