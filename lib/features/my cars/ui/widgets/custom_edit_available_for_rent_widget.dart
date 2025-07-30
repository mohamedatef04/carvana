import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditAvailableForRentWidget extends StatefulWidget {
  const CustomEditAvailableForRentWidget({
    super.key,
    required this.onChanged,
    required this.carModel,
  });
  final ValueChanged<bool> onChanged;

  final CarModel carModel;

  @override
  State<CustomEditAvailableForRentWidget> createState() =>
      _CustomEditAvailableForRentWidgetState();
}

class _CustomEditAvailableForRentWidgetState
    extends State<CustomEditAvailableForRentWidget> {
  @override
  void initState() {
    isChecked = widget.carModel.availableForRent;
    super.initState();
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Text(
            'Available For Rent ?',
            style: AppStyles.black20.copyWith(color: Colors.white),
          ),
          const Spacer(),
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              activeColor: Colors.amber,
              value: isChecked,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                  widget.onChanged(isChecked);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
