import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/auth/ui/views/login_view.dart';
import 'package:carvana/features/onboarding/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Easy Way to Buy\nYour Dream Car',

                  style: AppStyles.white36.copyWith(height: 0),
                ),
                Text(
                  'By using a car you can move quickly\nfrom one place to another\nin your daily life .',
                  style: AppStyles.grey16,
                ),
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Image.asset(
                            Assets.imagesCar3,
                            width: MediaQuery.sizeOf(context).width,
                            height: 320.h,
                            fit: BoxFit.cover,
                          )
                          .animate(
                            effects: EffectList(),
                            delay: const Duration(seconds: 1),
                          )
                          .slideX(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastEaseInToSlowEaseOut,
                          ),
                    ],
                  ),
                ),

                CustomElevatedButton(
                  text: 'Get Started',
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(LoginView.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
