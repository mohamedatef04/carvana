import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAvailableForRentWidget extends StatefulWidget {
  const CustomAvailableForRentWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomAvailableForRentWidget> createState() =>
      _CustomAvailableForRentWidgetState();
}

class _CustomAvailableForRentWidgetState
    extends State<CustomAvailableForRentWidget> {
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
