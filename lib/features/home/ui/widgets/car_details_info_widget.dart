import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/home/ui/widgets/car_details_overview_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_seller_contact_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_seller_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsInfoWidget extends StatelessWidget {
  const CarDetailsInfoWidget({super.key, required this.carModel});
  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 36, 34, 34),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.r),
          topRight: Radius.circular(50.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          spacing: 10.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    carModel.carModel,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.black24.copyWith(color: Colors.white),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: 70.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,

                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        carModel.carStatus,
                        style: AppStyles.black20.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Available For Rent',
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.black24.copyWith(
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amberAccent,
                    ),
                    child: Center(
                      child: carModel.availableForRent == true
                          ? Icon(Icons.check, color: Colors.black, size: 20.sp)
                          : Icon(Icons.close, color: Colors.black, size: 20.sp),
                    ),
                  ),
                ),
              ],
            ),

            Text(carModel.carDescription, style: AppStyles.grey16),
            Divider(color: AppColors.greyColor, thickness: 0.5.h),

            Row(
              spacing: 5.w,
              children: [
                CustomSellerImageWidget(carModel: carModel),
                Text(
                  carModel.sellerName,
                  style: AppStyles.white16.copyWith(fontSize: 18.sp),
                ),

                const Spacer(),
                CustomSellerContactWidget(carModel: carModel),
              ],
            ),
            Text(
              'Overview',
              style: AppStyles.white16.copyWith(fontSize: 24.sp),
            ),
            CarDetailsOverviewWidget(carModel: carModel),
          ],
        ),
      ),
    );
  }
}
