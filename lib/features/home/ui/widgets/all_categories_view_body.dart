import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/ui/widgets/category_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AllCategoriesViewBody extends StatefulWidget {
  const AllCategoriesViewBody({super.key});

  @override
  State<AllCategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<AllCategoriesViewBody> {
  final List<CategoryIndexModel> categories1 = [
    CategoryIndexModel(image: Assets.imagesTesla, title: 'Tesla'),
    CategoryIndexModel(image: Assets.imagesBmw, title: 'BMW'),
    CategoryIndexModel(image: Assets.imagesFerrari, title: 'Ferrari'),
    CategoryIndexModel(image: Assets.imagesMercedes, title: 'Mercedes'),
  ];

  final List<CategoryIndexModel> categories2 = [
    CategoryIndexModel(image: Assets.imagesAudi, title: 'Audi'),
    CategoryIndexModel(image: Assets.imagesChevrlet, title: 'Chevrlet'),
    CategoryIndexModel(image: Assets.imagesHyundai, title: 'Hyundai'),
    CategoryIndexModel(image: Assets.imagesKia, title: 'Kia'),
  ];
  final List<CategoryIndexModel> categories3 = [
    CategoryIndexModel(image: Assets.imagesFord, title: 'Ford'),
    CategoryIndexModel(image: Assets.imagesToyota, title: 'Toyota'),
    CategoryIndexModel(image: Assets.imagesSuzuki, title: 'Suzuki'),
    CategoryIndexModel(image: Assets.imagesNissan, title: 'Nissan'),
  ];
  final List<CategoryIndexModel> categories4 = [
    CategoryIndexModel(image: Assets.imagesPeugeot, title: 'Peugeot'),
    CategoryIndexModel(image: Assets.imagesLandrover, title: 'Land Rover'),
    CategoryIndexModel(image: Assets.imagesJeep, title: 'Jeep'),
    CategoryIndexModel(image: Assets.imagesLamborghini, title: 'Lamborghini'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Brands',
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: categories1
                    .map(
                      (e) =>
                          Expanded(child: CategoryIndex(categoryIndexModel: e)),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Row(
                children: categories2
                    .map(
                      (e) =>
                          Expanded(child: CategoryIndex(categoryIndexModel: e)),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Row(
                children: categories3
                    .map(
                      (e) =>
                          Expanded(child: CategoryIndex(categoryIndexModel: e)),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Row(
                children: categories4
                    .map(
                      (e) =>
                          Expanded(child: CategoryIndex(categoryIndexModel: e)),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
