import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_state.dart';
import 'package:carvana/features/search/ui/views/search_view.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  String? userName;
  String? imageUrl;
  @override
  void initState() {
    context.read<GetUserDataCubit>().getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(Icons.menu),
            ),
            title: Text(
              'Welcome !',
              style: AppStyles.black24.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              state.userDataModel.firstName +
                  ' ' +
                  state.userDataModel.lastName,
              style: AppStyles.grey16.copyWith(fontSize: 18.sp),
            ),

            trailing: Row(
              spacing: 10.w,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    await GoRouter.of(
                      context,
                    ).push(SearchView.routeName);

                    context.read<GetFavouritesCubit>().getFavList();
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.veryDarkGreyColor,
                      border: Border.all(color: AppColors.darkGreyColor),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        Assets.imagesSearch,
                        color: Colors.grey,
                        width: 40.w,
                        height: 25.h,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.veryDarkGreyColor,
                    border: Border.all(color: AppColors.darkGreyColor),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        state.userDataModel.imageUrl ??
                            'https://cdn-icons-png.flaticon.com/128/149/149071.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetUserDataFailure) {
          return Text(state.errorMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
