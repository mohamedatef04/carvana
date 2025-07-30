import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/home/logic/cubits/nav_bar/nav_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: Colors.transparent,
      tabMargin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      haptic: true, // haptic feedback
      tabBorderRadius: 30.r,
      curve: Curves.easeIn, // tab animation curves
      duration: const Duration(milliseconds: 200), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey[800], // unselected icon color
      activeColor: AppColors.blackColor, // selected icon and text color
      iconSize: 20, // tab button icon size
      tabBackgroundColor: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
      onTabChange: (value) {
        context.read<NavBarCubit>().changeIndex(value);
      }, // navigation bar padding
      tabs: const [
        GButton(icon: Icons.home, text: 'Home'),
        GButton(icon: Icons.explore, text: 'explore'),
        GButton(icon: Icons.favorite, text: 'Wishlist'),
        GButton(icon: Icons.person, text: 'Profile'),
      ],
    );
  }
}
