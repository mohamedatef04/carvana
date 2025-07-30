import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/logic/cubits/get_cars_for_each_brand/get_cars_for_each_brand_cubit.dart';
import 'package:carvana/features/home/ui/widgets/category_view_item.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryViewBody extends StatefulWidget {
  const CategoryViewBody({super.key, required this.categoryIndexModel});

  final CategoryIndexModel categoryIndexModel;

  @override
  State<CategoryViewBody> createState() => _CategoryViewBodyState();
}

class _CategoryViewBodyState extends State<CategoryViewBody> {
  @override
  void initState() {
    context.read<GetCarsForEachBrandCubit>().getCarsForEachBrand(
      brandName: widget.categoryIndexModel.title,
    );
    context.read<GetFavouritesCubit>().getFavList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.categoryIndexModel.title,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: BlocBuilder<GetCarsForEachBrandCubit, GetCarsForEachBrandState>(
        builder: (context, state) {
          if (state is GetCarsForEachBrandSuccessState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.6,
              ),
              itemCount: state.carsForEachBrand.length,
              itemBuilder: (context, index) {
                return CategoryViewItem(
                  carModel: state.carsForEachBrand[index],
                );
              },
            );
          } else if (state is GetCarsForEachBrandFailureState) {
            return Center(child: Text(state.errorMessage));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: CategoryViewItem(carModel: CarModel.placeholder()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
