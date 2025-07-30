import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/explore/logic/cubits/get_explore_cars/get_explore_cars_cubit.dart';
import 'package:carvana/features/explore/ui/widgets/explore_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});
  static const routeName = '/explore-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<GetExploreCarsCubit>(),

      child: const Scaffold(body: ExploreViewBody()),
    );
  }
}
