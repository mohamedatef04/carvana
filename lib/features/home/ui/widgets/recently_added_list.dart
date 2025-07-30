import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/home/logic/cubits/get_recently_added_cars/get_recently_added_cars_cubit.dart';
import 'package:carvana/features/home/ui/widgets/home_car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecentlyAddedList extends StatelessWidget {
  const RecentlyAddedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecentlyAddedCarsCubit, GetRecentlyAddedCarsState>(
      builder: (context, state) {
        if (state is GetRecentlyAddedCarsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => HomeCarItem(carModel: state.carsList[index]),
              childCount: state.carsList.length,
            ),
          );
        } else if (state is GetRecentlyAddedCarsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Skeletonizer(
                enabled: true,
                child: HomeCarItem(carModel: CarModel.placeholder()),
              ),
              childCount: 3,
            ),
          );
        }
      },
    );
  }
}
