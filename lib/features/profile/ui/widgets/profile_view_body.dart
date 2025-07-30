import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_state.dart';
import 'package:carvana/features/profile/ui/widgets/custom_profile_column.widget_shimmer.dart';
import 'package:carvana/features/profile/ui/widgets/custom_profile_listtile.dart';
import 'package:carvana/features/profile/ui/widgets/logout_widget.dart';
import 'package:carvana/features/profile/ui/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Profile'),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
            builder: (context, state) {
              if (state is GetUserDataSuccess) {
                return Column(
                  spacing: 15.h,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ProfileImageWidget(
                        imageUrl:
                            state.userDataModel.imageUrl ??
                            'https://cdn-icons-png.flaticon.com/128/149/149071.png',
                      ),
                    ),
                    Expanded(
                      child: CustomProfileListtile(
                        leadingIcon: const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                        title: 'UserName',
                        subtitle:
                            state.userDataModel.firstName +
                            ' ' +
                            state.userDataModel.lastName,
                      ),
                    ),
                    Expanded(
                      child: CustomProfileListtile(
                        leadingIcon: const Icon(
                          Icons.email,
                          size: 30,
                          color: Colors.grey,
                        ),
                        title: 'Email',
                        subtitle: state.userDataModel.email,
                      ),
                    ),
                    Expanded(
                      child: CustomProfileListtile(
                        leadingIcon: const Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.grey,
                        ),
                        title: 'Phone Number',
                        subtitle: state.userDataModel.phoneNumber,
                      ),
                    ),
                    Expanded(
                      child: CustomProfileListtile(
                        leadingIcon: const Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.grey,
                        ),
                        title: 'Address',
                        subtitle: state.userDataModel.address,
                      ),
                    ),
                    const Expanded(child: LogoutWidget()),
                  ],
                );
              } else if (state is GetUserDataFailure) {
                return Center(child: Text(state.errorMessage));
              } else {
                return const Skeletonizer(
                  enabled: true,
                  child: CustomProfileColumnWidgetShimmer(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
