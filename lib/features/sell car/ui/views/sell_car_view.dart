import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/notifications/data/repos/notifications_repo_impl.dart';
import 'package:carvana/features/notifications/logic/cubits/send_notification_to_all_users/send_notification_to_all_users_cubit.dart';
import 'package:carvana/features/sell%20car/data/repos/car_images_repo_impl.dart';
import 'package:carvana/features/sell%20car/data/repos/upload_car_repo_impl.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_cubit.dart';
import 'package:carvana/features/sell%20car/logic/cubits/upload_car_cubit.dart';

import 'package:carvana/features/sell%20car/ui/widgets/sell_car_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SellCarView extends StatelessWidget {
  const SellCarView({super.key});
  static const routeName = '/upload-car-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarImagesCubit(getIt.get<CarImagesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => UploadCarCubit(getIt.get<UploadCarRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => SendNotificationToAllUsersCubit(
            getIt.get<NotificationsRepoImpl>(),
          ),
        ),
      ],
      child:
          BlocConsumer<
            SendNotificationToAllUsersCubit,
            SendNotificationToAllUsersState
          >(
            listener: (context, state) {
              if (state is SendNotificationToAllUsersFailure) {
                showSnakBar(
                  context,
                  message: state.errorMessage,
                  color: AppColors.whiteColor,
                );
              } else {}
            },
            builder: (context, state) {
              return Scaffold(
                body: ModalProgressHUD(
                  inAsyncCall: state is UploadCarLoading,
                  child: const SellCarViewBody(),
                ),
              );
            },
          ),
    );
  }
}
