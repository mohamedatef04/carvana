import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditCarTypeWidget extends StatefulWidget {
  const CustomEditCarTypeWidget({
    super.key,
    required this.onTypeSelected,
    required this.carModel,
  });

  final ValueChanged<String> onTypeSelected;

  final CarModel carModel;

  @override
  State<CustomEditCarTypeWidget> createState() => _CustomCarTypeState();
}

class _CustomCarTypeState extends State<CustomEditCarTypeWidget> {
  String selectedType = 'New';

  @override
  void initState() {
    selectedType = widget.carModel.carStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type of Car',
          style: AppStyles.black20.copyWith(color: Colors.white),
        ),
        Row(
          spacing: 10.w,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedType = 'New';
                    widget.onTypeSelected(selectedType);
                  });
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: selectedType == 'New'
                        ? Colors.amber
                        : AppColors.darkGreyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'New',
                      style: selectedType == 'New'
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
                    selectedType = 'Used';
                    widget.onTypeSelected(selectedType);
                  });
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: selectedType == 'Used'
                        ? Colors.amber
                        : AppColors.darkGreyColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      'Used',
                      style: selectedType == 'Used'
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
    );
  }
}
