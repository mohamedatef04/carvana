import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  final Widget icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.veryDarkGreyColor,
            border: Border.all(color: AppColors.darkGreyColor),
            shape: BoxShape.circle,
          ),
          child: Center(child: icon),
        ),
        Text(title, style: AppStyles.white16),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        ),
      ],
    );
  }
}
