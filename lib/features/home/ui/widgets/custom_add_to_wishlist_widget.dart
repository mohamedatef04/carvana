import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/wishlist/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddToWishlistWidget extends StatelessWidget {
  const CustomAddToWishlistWidget({super.key, required this.carModel});
  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesCubit, GetFavouritesState>(
      builder: (context, favState) {
        bool isFavorited = false;

        if (favState is GetFavouritesSuccessState) {
          isFavorited = favState.favList.any(
            (car) => car.carId == carModel.carId,
          );
        }

        return Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.veryDarkGreyColor,
            border: Border.all(color: AppColors.darkGreyColor),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                if (isFavorited) {
                  context.read<GetFavouritesCubit>().removeFav(
                    carId: carModel.carId!,
                  );
                } else {
                  context
                      .read<AddToFavCubit>()
                      .addToFav(carId: carModel.carId!)
                      .then((_) {
                        context.read<GetFavouritesCubit>().getFavList();
                      });
                }
              },
              iconSize: 20.sp,
              icon: Icon(
                Icons.favorite,
                color: isFavorited ? Colors.red : Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
