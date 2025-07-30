import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/home/ui/widgets/custom_car_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsOverviewWidget extends StatelessWidget {
  const CarDetailsOverviewWidget({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesSeatsIcon,
                title: 'Capacity',
                value: carModel.carCapacity,
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesEngineIcon,
                title: 'Engine',
                value: '${carModel.carEngine} cc',
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesFuel,
                title: 'Fuel',
                value: carModel.carFuel,
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesPowerIcon,
                title: 'Transmission',
                value: carModel.carTransmission,
              ),
            ),
          ],
        ),
        Divider(color: AppColors.greyColor, thickness: 0.5.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesAutoPark,
                title: 'Advance',
                value: carModel.carManufuctureYear,
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesMaxSpeedIcon,
                title: 'Max Speed',
                value: '${carModel.carMaxSpeed} km/h',
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesAdvaceIcon,
                title: 'Litres',
                value: '${carModel.carNumberOfLitresBer100Km} L/100km',
              ),
            ),
            Expanded(
              child: CustomCarInfoWidget(
                image: Assets.imagesPaint,
                title: 'Color',
                value: carModel.carColor,
              ),
            ),
          ],
        ),
        Divider(color: AppColors.greyColor, thickness: 0.5.h),

        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 80.h,
          decoration: BoxDecoration(
            color: AppColors.darkGreyColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Text(
                  'Car Price',
                  style: AppStyles.black20.copyWith(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  '${carModel.carPrice} LE',
                  style: AppStyles.black20.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
