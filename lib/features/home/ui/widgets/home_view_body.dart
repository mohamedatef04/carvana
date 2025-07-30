import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/home/logic/cubits/get_recently_added_cars/get_recently_added_cars_cubit.dart';
import 'package:carvana/features/home/ui/views/all_categories_view.dart';
import 'package:carvana/features/home/ui/widgets/custom_drawer.dart';
import 'package:carvana/features/home/ui/widgets/custom_list_tile.dart';
import 'package:carvana/features/home/ui/widgets/custom_title_row.dart';
import 'package:carvana/features/home/ui/widgets/home_categories_items.dart';
import 'package:carvana/features/home/ui/widgets/recently_added_list.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  @override
  void initState() {
    context.read<GetRecentlyAddedCarsCubit>().getRecentlyAddedCars();
    context.read<GetFavouritesCubit>().getFavList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomListTile(
                    onPressed: () {
                      drawerKey.currentState?.openDrawer();
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),

                SliverToBoxAdapter(
                  child: CustomTitleRow(
                    title: 'Brands',
                    onTap: () async {
                      await GoRouter.of(
                        context,
                      ).push(AllCategoriesView.routeName);
                      context
                          .read<GetFavouritesCubit>()
                          .getFavList(); // refresh after return
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                const SliverToBoxAdapter(child: HomeCategoriesItems()),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                SliverToBoxAdapter(
                  child: Text(
                    'Recently Added',
                    style: AppStyles.black20.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                const RecentlyAddedList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
