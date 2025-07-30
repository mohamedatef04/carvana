import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/home/logic/cubits/get_recently_added_cars/get_recently_added_cars_cubit.dart';
import 'package:carvana/features/home/ui/widgets/custom_drawer_item.dart';
import 'package:carvana/features/my%20cars/ui/views/my_uploaded_cars_view.dart';
import 'package:carvana/features/notifications/ui/views/notifications_view.dart';
import 'package:carvana/features/sell%20car/ui/views/sell_car_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomDrawerGeneralSettingWidget extends StatelessWidget {
  const CustomDrawerGeneralSettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General',
          style: AppStyles.white16.copyWith(fontSize: 18.sp),
        ),
        CustomDrawerItem(
          icon: Image.asset(
            Assets.imagesNotificationBell,
            color: AppColors.greyColor,
            height: 25.h,
          ),
          title: 'Notifications',
          onPressed: () {
            GoRouter.of(context).push(NotificationsView.routeName);
          },
        ),
        CustomDrawerItem(
          icon: const Icon(Icons.add),
          title: 'Sell Your Car',
          onPressed: () async {
            final res = await GoRouter.of(
              context,
            ).push<bool>(SellCarView.routeName);
            if (res == true) {
              context.read<GetRecentlyAddedCarsCubit>().getRecentlyAddedCars();
            }
          },
        ),
        CustomDrawerItem(
          icon: const Icon(Icons.car_crash),
          title: 'My Cars',
          onPressed: () async {
            final res = await GoRouter.of(
              context,
            ).push<bool>(MyUploadedCarsView.routeName);
            if (res == true) {
              context.read<GetRecentlyAddedCarsCubit>().getRecentlyAddedCars();
            }
          },
        ),

        const Divider(),
      ],
    );
  }
}
