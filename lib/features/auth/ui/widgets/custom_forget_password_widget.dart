import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/views/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomForgetPasswordWidget extends StatelessWidget {
  const CustomForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(ForgetPasswordView.routeName);
      },
      child: Text('Forgot Password?', style: AppStyles.grey16),
    );
  }
}
