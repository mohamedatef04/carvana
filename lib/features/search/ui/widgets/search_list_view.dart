import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/search/logic/cubits/get_all_cars_list_cubit.dart';
import 'package:carvana/features/search/ui/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchedCarsListCubit, GetSearchedCarsListState>(
      builder: (context, state) {
        if (state is GetSearchedCarsListLoadedState) {
          return SliverList.builder(
            itemBuilder: (context, index) =>
                SearchItem(carModel: state.carsList[index]),
            itemCount: state.carsList.length,
          );
        } else if (state is GetSearchedCarsListFailureState) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else if (state is GetSearchedCarsListEmptyState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No cars found',
                style: AppStyles.black20.copyWith(color: Colors.white),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Start searching!',
                style: AppStyles.black20.copyWith(color: Colors.white),
              ),
            ),
          );
        }
      },
    );
  }
}
