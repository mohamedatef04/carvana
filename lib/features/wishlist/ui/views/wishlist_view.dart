import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:carvana/features/wishlist/ui/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});
  static const routeName = '/wishlist-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<GetFavouritesCubit>(),

      child: BlocConsumer<GetFavouritesCubit, GetFavouritesState>(
        listener: (context, state) {
          if (state is RemovedFavSuccessState) {
            showSnakBar(
              context,
              message: 'Removed from wishlist',
              color: AppColors.whiteColor,
            );
          } else if (state is GetFavouritesErrorState) {
            showSnakBar(
              context,
              message: state.errorMessage,
              color: AppColors.whiteColor,
            );
          }
        },
        builder: (context, state) {
          return const Scaffold(body: WishlistViewBody());
        },
      ),
    );
  }
}
