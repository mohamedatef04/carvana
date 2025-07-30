import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:carvana/features/home/ui/widgets/main_home_view_body.dart';
import 'package:carvana/features/profile/data/repos/profile_repo_impl.dart';
import 'package:carvana/features/profile/logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:carvana/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:carvana/features/wishlist/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});
  static const routeName = '/main-home-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(
          create: (context) => AddToFavCubit(getIt.get<WishlistRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouritesCubit(getIt.get<WishlistRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetUserDataCubit(getIt.get<ProfileRepoImpl>()),
        ),
      ],
      child: const Scaffold(
        body: MainHomeViewBody(),
      ),
    );
  }
}
