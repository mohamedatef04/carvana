import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/search/data/repos/search_repo_impl.dart';
import 'package:carvana/features/search/logic/cubits/get_all_cars_list_cubit.dart';
import 'package:carvana/features/search/ui/widgets/search_view_body.dart';
import 'package:carvana/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:carvana/features/wishlist/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static const routeName = '/search-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetSearchedCarsListCubit(getIt.get<SearchRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetFavouritesCubit(getIt.get<WishlistRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddToFavCubit(getIt.get<WishlistRepoImpl>()),
        ),
      ],
      child: const Scaffold(body: SearchViewBody()),
    );
  }
}
