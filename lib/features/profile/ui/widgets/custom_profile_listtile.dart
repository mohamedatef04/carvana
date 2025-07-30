import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileListtile extends StatelessWidget {
  const CustomProfileListtile({
    super.key,
    this.leadingIcon,
    required this.title,
    required this.subtitle,
    this.trailingIcon,
  });

  final Widget? leadingIcon;
  final String title;
  final String subtitle;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.veryDarkGreyColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ListTile(
        leading: leadingIcon,
        title: Text(title, style: AppStyles.white16),
        subtitle: Text(subtitle, style: AppStyles.grey16),
      ),
    );
  }
}
