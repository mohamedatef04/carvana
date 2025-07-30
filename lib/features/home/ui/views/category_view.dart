import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/data/repos/home_repo_impl.dart';
import 'package:carvana/features/home/logic/cubits/get_cars_for_each_brand/get_cars_for_each_brand_cubit.dart';
import 'package:carvana/features/home/ui/widgets/category_view_body.dart';
import 'package:carvana/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:carvana/features/wishlist/logic/cubits/add_to_fav/add_to_fav_cubit.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryIndexModel});
  static const String routeName = '/category-view';

  final CategoryIndexModel categoryIndexModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetCarsForEachBrandCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                GetFavouritesCubit(getIt.get<WishlistRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => AddToFavCubit(getIt.get<WishlistRepoImpl>()),
          ),
        ],

        child: CategoryViewBody(categoryIndexModel: categoryIndexModel),
      ),
    );
  }
}
