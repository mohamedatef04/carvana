import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CusomCarOwnerInformation extends StatelessWidget {
  const CusomCarOwnerInformation({
    super.key,
    required this.ownerNameController,
    required this.ownerEmailController,
    required this.ownerPhoneNumberController,
    required this.ownerAddressController,
  });

  final TextEditingController ownerNameController;
  final TextEditingController ownerEmailController;
  final TextEditingController ownerPhoneNumberController;
  final TextEditingController ownerAddressController;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text(
            'Car Owner Information',
            style: AppStyles.black24.copyWith(color: Colors.white),
          ),
          CustomTextFormField(
            controller: ownerNameController,
            hintText: 'Owner Name',
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter owner name';
              }
              return null;
            },
          ),
          CustomTextFormField(
            controller: ownerEmailController,
            hintText: 'Owner Email',
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter owner email';
              } else if (!p0.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          CustomTextFormField(
            controller: ownerPhoneNumberController,
            hintText: 'Owner Phone Number',
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter owner phone number';
              } else if (p0.length != 11) {
                return 'Please enter a valid phone number';
              }
              return null;
            },
          ),
          CustomTextFormField(
            controller: ownerAddressController,
            hintText: 'Owner Address',
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Please enter owner address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
