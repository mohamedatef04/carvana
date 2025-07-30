import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditCarBrandWidget extends StatefulWidget {
  const CustomEditCarBrandWidget({
    super.key,
    required this.onBrandSelected,
    required this.carModel,
  });

  final ValueChanged<String> onBrandSelected;

  final CarModel carModel;

  @override
  State<CustomEditCarBrandWidget> createState() => _CsutomCarBrandWidgetState();
}

class _CsutomCarBrandWidgetState extends State<CustomEditCarBrandWidget> {
  String selectedBrand = 'Tesla';

  List<String> carBrands1 = [
    'Tesla',
    'BMW',
    'Ferrari',
    'Mercedes',
    'Audi',
    'Chevrlet',
    'Hyundai',
    'Kia',
  ];
  List<String> carBrands2 = [
    'Ford',
    'Toyota',
    'Suzuki',
    'Nissan',
    'Peugeot',
    'Land Rover',
    'Jeep',
    'Lamborghini',
  ];
  @override
  void initState() {
    selectedBrand = widget.carModel.carBrand;
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
            'Car Brand',
            style: AppStyles.black20.copyWith(color: Colors.white),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,

            decoration: BoxDecoration(
              color: AppColors.darkGreyColor,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.veryDarkGreyColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 10.h,
                    children: carBrands1
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBrand = e;
                                widget.onBrandSelected(selectedBrand);
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                  color: selectedBrand == e
                                      ? Colors.amber
                                      : AppColors.darkGreyColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Center(
                                  child: Text(e, style: AppStyles.black18),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 500.h,
                  child: const VerticalDivider(color: AppColors.greyColor),
                ),
                Expanded(
                  child: Column(
                    spacing: 10.h,
                    children: carBrands2
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedBrand = e;
                                widget.onBrandSelected(selectedBrand);
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                  color: selectedBrand == e
                                      ? Colors.amber
                                      : AppColors.darkGreyColor,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Center(
                                  child: Text(e, style: AppStyles.black18),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
