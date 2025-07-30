import 'package:carvana/core/widgets/custom_nav_bar.dart';
import 'package:carvana/features/explore/ui/views/explore_view.dart';
import 'package:carvana/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:carvana/features/home/ui/views/home_view.dart';
import 'package:carvana/features/profile/ui/views/profile_view.dart';
import 'package:carvana/features/wishlist/ui/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeViewBody extends StatefulWidget {
  const MainHomeViewBody({super.key});

  @override
  State<MainHomeViewBody> createState() => _MainHomeViewBodyState();
}

class _MainHomeViewBodyState extends State<MainHomeViewBody> {
  List<Widget> screens = [
    const HomeView(),
    const ExploreView(),
    const WishlistView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarCubit, NavBarState>(
      listener: (context, state) {
        if (state is NavBarIndexChanged) {}
      },
      builder: (context, state) {
        return Scaffold(
          body: screens[context.read<NavBarCubit>().currentIndex],
          bottomNavigationBar: const CustomNavBar(),
        );
      },
    );
  }
}
