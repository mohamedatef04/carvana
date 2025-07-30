import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomConfirmPasswordTextField extends StatefulWidget {
  const CustomConfirmPasswordTextField({
    super.key,
    required this.confirmPasswordController,
  });
  final TextEditingController confirmPasswordController;

  @override
  State<CustomConfirmPasswordTextField> createState() =>
      _CustomConfirmPasswordTextFieldState();
}

class _CustomConfirmPasswordTextFieldState
    extends State<CustomConfirmPasswordTextField> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.confirmPasswordController,
      obscureText: obsecureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obsecureText = !obsecureText;
          });
        },
        icon: obsecureText
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
      hintText: 'Password',
    );
  }
}
