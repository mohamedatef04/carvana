import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/my%20cars/ui/widgets/custom_edit_car_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditCarInformationWidget extends StatelessWidget {
  const CustomEditCarInformationWidget({
    super.key,
    required this.onTypeSelected,
    required this.carModel,
  });
  final void Function(String) onTypeSelected;

  final CarModel carModel;

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

          CustomEditCarTypeWidget(
            onTypeSelected: onTypeSelected,
            carModel: carModel,
          ),
        ],
      ),
    );
  }
}
