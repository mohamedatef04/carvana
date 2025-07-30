import 'package:carvana/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAlreadyHaveAnAccountWidget extends StatelessWidget {
  const CustomAlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: AppStyles.grey16),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text('Login', style: AppStyles.grey16),
        ),
      ],
    );
  }
}
