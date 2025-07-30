import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTitleRow extends StatelessWidget {
  const CustomTitleRow({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.black20.copyWith(color: AppColors.greyColor),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View All',
            style: AppStyles.grey16.copyWith(color: Colors.amber),
          ),
        ),
      ],
    );
  }
}
