import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/explore/logic/cubits/get_explore_cars/get_explore_cars_cubit.dart';
import 'package:carvana/features/explore/ui/widgets/expore_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreItemsGridView extends StatelessWidget {
  const ExploreItemsGridView({super.key});

  Future<void> _refresh(BuildContext context) async {
    context.read<GetExploreCarsCubit>().getExploreCars(forceRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExploreCarsCubit, GetExploreCarsState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => _refresh(context),
          child: () {
            if (state is GetExploreCarsLoadedState) {
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  childAspectRatio: 0.62,
                ),
                itemCount: state.carsList.length,
                itemBuilder: (context, index) {
                  return ExploreItem(carModel: state.carsList[index]);
                },
              );
            } else if (state is GetExploreCarsErrorState) {
              // Wrap error message with ListView to allow pull-to-refresh
              return ListView(
                children: [
                  const SizedBox(height: 200),
                  Center(child: Text(state.errorMessage)),
                ],
              );
            } else {
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.w,
                  childAspectRatio: 0.62,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    child: ExploreItem(carModel: CarModel.placeholder()),
                  );
                },
              );
            }
          }(),
        );
      },
    );
  }
}
