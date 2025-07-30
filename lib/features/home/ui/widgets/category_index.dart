import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/ui/views/category_view.dart';
import 'package:carvana/features/wishlist/logic/cubits/get_favourites/get_favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryIndex extends StatelessWidget {
  const CategoryIndex({super.key, required this.categoryIndexModel});

  final CategoryIndexModel categoryIndexModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await GoRouter.of(
          context,
        ).push(CategoryView.routeName, extra: categoryIndexModel);
        context.read<GetFavouritesCubit>().getFavList();
      },
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.veryDarkGreyColor,
            ),
            child: Center(
              child: Image.asset(categoryIndexModel.image, height: 35.h),
            ),
          ),
          Text(
            categoryIndexModel.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.grey16.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
