import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarAutoParkWidget extends StatefulWidget {
  const CustomCarAutoParkWidget({
    super.key,
    required this.onAutoParkTypeChanged,
  });
  final ValueChanged<String> onAutoParkTypeChanged;

  @override
  State<CustomCarAutoParkWidget> createState() =>
      _CustomCarAutoParkWidgetState();
}

class _CustomCarAutoParkWidgetState extends State<CustomCarAutoParkWidget> {
  String autoParkType = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Auto Park Type',
            style: AppStyles.black20.copyWith(color: Colors.white),
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      autoParkType = 'Non Auto';
                      widget.onAutoParkTypeChanged(autoParkType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: autoParkType == 'Non Auto'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Non Auto',
                        style: autoParkType == 'Non Auto'
                            ? AppStyles.black20
                            : AppStyles.black20.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      autoParkType = 'Auto';
                      widget.onAutoParkTypeChanged(autoParkType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: autoParkType == 'Auto'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Auto',
                        style: autoParkType == 'Auto'
                            ? AppStyles.black20
                            : AppStyles.black20.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
