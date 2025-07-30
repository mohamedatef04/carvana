import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/home/ui/widgets/all_categories_view_body.dart';
import 'package:carvana/features/wishlist/data/repos/wishlist_repo_impl.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});
  static const String routeName = '/categories-view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetFavouritesCubit(getIt.get<WishlistRepoImpl>()),
      child: const Scaffold(body: AllCategoriesViewBody()),
    );
  }
}
