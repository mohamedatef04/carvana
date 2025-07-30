import 'package:carvana/features/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomSignupPasswordTextField extends StatefulWidget {
  const CustomSignupPasswordTextField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<CustomSignupPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState
    extends State<CustomSignupPasswordTextField> {
  bool obsecureText = true;
  final regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~%^()\-_=+{}\[\]:;"<>,.?/\\|]).{8,}$',
  );
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.passwordController,
      obscureText: obsecureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (value.length < 6 || !regex.hasMatch(value)) {
          return 'Password must be at least 8 characters long and\ncontain at least one letter and one number';
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
