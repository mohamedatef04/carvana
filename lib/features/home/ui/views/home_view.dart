import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/home/data/repos/home_repo_impl.dart';
import 'package:carvana/features/home/logic/cubits/get_recently_added_cars/get_recently_added_cars_cubit.dart';
import 'package:carvana/features/home/ui/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetRecentlyAddedCarsCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
