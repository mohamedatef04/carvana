import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDontHaveAnAccountWidget extends StatelessWidget {
  const CustomDontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: AppStyles.grey16),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(SignupView.routeName);
          },
          child: Text(' Sign Up', style: AppStyles.grey16),
        ),
      ],
    );
  }
}
