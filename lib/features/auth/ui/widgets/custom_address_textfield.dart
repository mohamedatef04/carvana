import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomAddressTextfield extends StatefulWidget {
  const CustomAddressTextfield({super.key, required this.addressController});

  final TextEditingController addressController;

  @override
  State<CustomAddressTextfield> createState() => _CustomAddressTextfieldState();
}

class _CustomAddressTextfieldState extends State<CustomAddressTextfield> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.addressController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address';
        }
        return null;
      },
      hintText: 'Address',
    );
  }
}
