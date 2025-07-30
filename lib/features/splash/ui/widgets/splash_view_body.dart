import 'package:carvana/core/services/supabase_auth_service.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:carvana/features/home/ui/views/main_home_view.dart';
import 'package:carvana/features/onboarding/ui/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      bool isSignedIn = await SupabaseAuthService().isSignedIn();
      if (isSignedIn) {
        GoRouter.of(context).pushReplacement(MainHomeView.routeName);
      } else {
        GoRouter.of(context).pushReplacement(OnboardingView.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesLogo, width: 200.w, height: 200.h)
                .animate(
                  effects: EffectList(),
                  delay: const Duration(seconds: 1),
                )
                .slideX(duration: const Duration(seconds: 1)),
          ],
        ),
      ),
    );
  }
}
