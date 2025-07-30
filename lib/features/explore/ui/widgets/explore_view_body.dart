import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/explore/logic/cubits/get_explore_cars/get_explore_cars_cubit.dart';
import 'package:carvana/features/explore/ui/widgets/explore_items_grid_view.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreViewBody extends StatefulWidget {
  const ExploreViewBody({super.key});

  @override
  State<ExploreViewBody> createState() => _ExploreViewBodyState();
}

class _ExploreViewBodyState extends State<ExploreViewBody> {
  @override
  void initState() {
    context.read<GetExploreCarsCubit>().getExploreCars();
    context.read<GetFavouritesCubit>().getFavList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Explore'),

      body: ExploreItemsGridView(),
    );
  }
}
