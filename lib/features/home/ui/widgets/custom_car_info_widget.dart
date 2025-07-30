import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarInfoWidget extends StatelessWidget {
  const CustomCarInfoWidget({
    super.key,
    required this.image,
    required this.title,
    required this.value,
  });

  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Container(
          width: 70.w,
          height: 70.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,

            color: AppColors.darkGreyColor,
          ),
          child: Center(
            child: Image.asset(image, height: 35.h, color: AppColors.greyColor),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.white16.copyWith(fontSize: 13.sp),
        ),
        Text(
          value,
          style: AppStyles.grey16.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
