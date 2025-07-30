import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/sell%20car/ui/widgets/custom_car_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarInformation extends StatelessWidget {
  const CustomCarInformation({super.key, required this.onTypeSelected});
  final void Function(String) onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            'Car  Information',
            style: AppStyles.black24.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10.h),

          CustomCarType(onTypeSelected: onTypeSelected),
        ],
      ),
    );
  }
}
