import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:carvana/features/wishlist/ui/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishListListview extends StatelessWidget {
  const WishListListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouritesCubit, GetFavouritesState>(
      builder: (context, state) {
        if (state is GetFavouritesSuccessState) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.favList.length,
            itemBuilder: (context, index) {
              return WishListItem(carModel: state.favList[index]);
            },
          );
        } else if (state is GetFavouritesEmptyState) {
          return Center(
            child: Text(
              'No cars added to wishlist',
              style: AppStyles.black20.copyWith(color: Colors.white),
            ),
          );
        } else if (state is GetFavouritesErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppStyles.black20.copyWith(color: Colors.white),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,

                child: WishListItem(carModel: CarModel.placeholder()),
              );
            },
          );
        }
      },
    );
  }
}
