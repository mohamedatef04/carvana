import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerUserInfoWidget extends StatelessWidget {
  const CustomDrawerUserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetUserDataFailure) {
          return Text(
            "Failed to load user data",
            style: AppStyles.white16,
          );
        } else if (state is GetUserDataSuccess) {
          final user = state.userDataModel;
          return Row(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.veryDarkGreyColor,
                  border: Border.all(color: AppColors.darkGreyColor),
                  shape: BoxShape.circle,
                  image: user.imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(user.imageUrl!),
                          fit: BoxFit.fill,
                        )
                      : const DecorationImage(
                          image: AssetImage(Assets.imagesProfile),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.firstName + ' ' + user.lastName,
                    style: AppStyles.white16,
                  ),
                  Text(
                    user.email,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.black14.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const SizedBox(); // Initial or unhandled state
        }
      },
    );
  }
}
