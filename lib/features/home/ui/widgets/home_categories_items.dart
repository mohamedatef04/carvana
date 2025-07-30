import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/home/data/models/category_index_model.dart';
import 'package:carvana/features/home/ui/widgets/category_index.dart';
import 'package:flutter/material.dart';

class HomeCategoriesItems extends StatefulWidget {
  const HomeCategoriesItems({super.key});

  @override
  State<HomeCategoriesItems> createState() => _HomeCategoriesItemsState();
}

class _HomeCategoriesItemsState extends State<HomeCategoriesItems> {
  List<CategoryIndexModel> categories = [
    CategoryIndexModel(title: 'Tesla', image: Assets.imagesTesla),
    CategoryIndexModel(title: 'BMW', image: Assets.imagesBmw),
    CategoryIndexModel(title: 'Ferrari', image: Assets.imagesFerrari),
    CategoryIndexModel(title: 'Mercedes', image: Assets.imagesMercedes),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: categories
          .map((e) => Expanded(child: CategoryIndex(categoryIndexModel: e)))
          .toList(),
    );
  }
}
