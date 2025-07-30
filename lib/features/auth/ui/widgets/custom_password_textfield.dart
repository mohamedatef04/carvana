import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
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
