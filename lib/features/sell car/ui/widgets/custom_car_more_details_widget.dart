import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarMoreDetailsWidget extends StatelessWidget {
  const CustomCarMoreDetailsWidget({
    super.key,
    required this.carModelCotroller,
    required this.carCapacityController,
    required this.engineController,
    required this.carMaxSpeedController,
    required this.carNumberOfLitresBer100Km,
    required this.carNumberOfSlyndersController,
    required this.carColorController,
    required this.carPriceController,
    required this.carDescriptionController,
    required this.carManufutureYear,
  });

  final TextEditingController carModelCotroller;
  final TextEditingController carCapacityController;
  final TextEditingController engineController;
  final TextEditingController carMaxSpeedController;
  final TextEditingController carNumberOfLitresBer100Km;
  final TextEditingController carNumberOfSlyndersController;
  final TextEditingController carManufutureYear;
  final TextEditingController carColorController;
  final TextEditingController carPriceController;
  final TextEditingController carDescriptionController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.h,
        children: [
          Text(
            'Car More Details',
            style: AppStyles.black24.copyWith(color: Colors.white),
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: carModelCotroller,
                  hintText: 'Car Model Name',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter car model name';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: carCapacityController,
                  hintText: 'Car Capacity',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter car capacity';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: engineController,
                  hintText: 'Engine',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter engine';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: carMaxSpeedController,
                  hintText: 'max speed',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter max speed';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: carNumberOfLitresBer100Km,
                  hintText: 'Litres / 100 km',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter number of litres';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: carNumberOfSlyndersController,
                  hintText: 'Number of Sylinders',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter number of sylinders';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            spacing: 10.w,
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: carColorController,
                  hintText: 'Color',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter color';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: carPriceController,
                  hintText: 'Price in LE',
                  keyboardType: TextInputType.number,
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          CustomTextFormField(
            controller: carManufutureYear,
            keyboardType: TextInputType.number,
            hintText: 'Car Manufacturer year',

            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter car manufacturer year';
              }
              return null;
            },
          ),
          CustomTextFormField(
            controller: carDescriptionController,
            hintText: 'Car Description',
            maxLines: 5,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter car description';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
