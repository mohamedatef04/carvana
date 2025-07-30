import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/explore/ui/widgets/icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomCardWidget extends StatelessWidget {
  const BottomCardWidget({
    super.key,
    required this.carModel,
  });

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),

      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 110.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: AppColors.blackColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          '₹ ${carModel.carNumberOfLitresBer100Km} L',
                          style: AppStyles.white16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      carModel.sellerName,
                      style: AppStyles.white16.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  carModel.carModel,
                  style: AppStyles.white16.copyWith(fontSize: 18.sp),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          IconText(
                            icon: Icons.precision_manufacturing_sharp,
                            text: '${carModel.carEngine} cc',
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          IconText(
                            icon: Icons.ev_station,
                            text: carModel.carTransmission,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          IconText(
                            icon: Icons.flash_on,
                            text: '${carModel.carMaxSpeed} km/h',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
