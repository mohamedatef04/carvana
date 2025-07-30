import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPhoneTextField extends StatefulWidget {
  const CustomPhoneTextField({super.key, required this.phoneController});
  final TextEditingController phoneController;

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Phone',
      controller: widget.phoneController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        } else if (value.length != 11) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }
}
