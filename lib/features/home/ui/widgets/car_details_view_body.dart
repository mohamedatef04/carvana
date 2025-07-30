import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/home/ui/widgets/car_details_info_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_car_details_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CarDetailsViewBody extends StatelessWidget {
  const CarDetailsViewBody({super.key, required this.carModel});
  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Car Details',
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              spacing: 15.h,
              children: [
                CustomCarDetailsImage(carModel: carModel),
                CarDetailsInfoWidget(carModel: carModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
