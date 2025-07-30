import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFirstAndLastNameWidget extends StatelessWidget {
  const CustomFirstAndLastNameWidget({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5.w,
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: 'First Name',
            controller: firstNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            hintText: 'Last Name',
            controller: lastNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
