import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarTransmitionWidhet extends StatefulWidget {
  const CustomCarTransmitionWidhet({
    super.key,
    required this.onTransmitionTypeChanged,
  });

  final ValueChanged<String> onTransmitionTypeChanged;

  @override
  State<CustomCarTransmitionWidhet> createState() =>
      _CustomCarTransmitionWidhetState();
}

class _CustomCarTransmitionWidhetState
    extends State<CustomCarTransmitionWidhet> {
  String transmitionType = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Transmition Type',
            style: AppStyles.black20.copyWith(color: Colors.white),
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      transmitionType = 'Auto';
                      widget.onTransmitionTypeChanged(transmitionType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: transmitionType == 'Auto'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Auto',
                        style: transmitionType == 'Auto'
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
                      transmitionType = 'Manual';
                      widget.onTransmitionTypeChanged(transmitionType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: transmitionType == 'Manual'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Manual',
                        style: transmitionType == 'Manual'
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
