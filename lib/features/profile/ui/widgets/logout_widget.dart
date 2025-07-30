import 'package:carvana/core/services/supabase_auth_service.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: GestureDetector(
        onTap: () async {
          await SupabaseAuthService().signOut();
          GoRouter.of(context).pushReplacement(LoginView.routeName);
        },
        child: Center(child: Text('Logout', style: AppStyles.black20)),
      ),
    );
  }
}
