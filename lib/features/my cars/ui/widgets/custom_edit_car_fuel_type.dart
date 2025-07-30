import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditCarFuelType extends StatefulWidget {
  const CustomEditCarFuelType({
    super.key,
    required this.onFuelTypeChanged,
    required this.carModel,
  });

  final ValueChanged<String> onFuelTypeChanged;

  final CarModel carModel;

  @override
  State<CustomEditCarFuelType> createState() => _CustomCarFuelTypeState();
}

class _CustomCarFuelTypeState extends State<CustomEditCarFuelType> {
  String fuelType = 'Petrol';
  @override
  void initState() {
    fuelType = widget.carModel.carFuel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Fuel Type',
            style: AppStyles.black20.copyWith(color: Colors.white),
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      fuelType = 'Petrol';
                      widget.onFuelTypeChanged(fuelType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: fuelType == 'Petrol'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Petrol',
                        style: fuelType == 'Petrol'
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
                      fuelType = 'Electric';
                      widget.onFuelTypeChanged(fuelType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: fuelType == 'Electric'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Electric',
                        style: fuelType == 'Electric'
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
                      fuelType = 'Diesel';
                      widget.onFuelTypeChanged(fuelType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: fuelType == 'Diesel'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Diesel',
                        style: fuelType == 'Diesel'
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
                      fuelType = 'Gas';
                      widget.onFuelTypeChanged(fuelType);
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: fuelType == 'Gas'
                          ? Colors.amber
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Center(
                      child: Text(
                        'Gas',
                        style: fuelType == 'Gas'
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
