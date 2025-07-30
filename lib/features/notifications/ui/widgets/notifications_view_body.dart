import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/notifications/data/models/notification_model.dart';
import 'package:carvana/features/notifications/logic/cubits/get_notifications/get_notifications_cubit.dart';
import 'package:carvana/features/notifications/ui/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  @override
  void initState() {
    context.read<GetNotificationsCubit>().getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
        builder: (context, state) {
          if (state is GetNotificationsSuccess) {
            return ListView.builder(
              itemCount: state.notificationsList.length,
              itemBuilder: (context, index) {
                final notification = state.notificationsList[index];
                return Dismissible(
                  key: Key(notification.id.toString()),

                  onDismissed: (_) {
                    context.read<GetNotificationsCubit>().deleteNotification(
                      notificationId: notification.id,
                    );
                  },

                  child: NotificationItem(
                    notificationModel: state.notificationsList[index],
                  ),
                );
              },
            );
          } else if (state is GetNotificationsEmpty) {
            return SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesNotifications,
                    width: 200.w,
                  ),
                ],
              ),
            );
          } else if (state is GetNotificationsError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: NotificationItem(
                    notificationModel: NotificationModel.placeHolder(),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
