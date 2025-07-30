import 'package:carvana/core/services/supabase_auth_service.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/ui/views/login_view.dart';
import 'package:carvana/features/home/ui/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawerSupportWidget extends StatefulWidget {
  const CustomDrawerSupportWidget({
    super.key,
  });

  @override
  State<CustomDrawerSupportWidget> createState() =>
      _CustomDrawerSupportWidgetState();
}

class _CustomDrawerSupportWidgetState extends State<CustomDrawerSupportWidget> {
  Future<void> contactUsByEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'smsm85579@gmail.com',
      queryParameters: {
        'subject': 'Contact from Car App',
      },
    );

    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email app');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Support',
          style: AppStyles.white16.copyWith(fontSize: 18.sp),
        ),
        CustomDrawerItem(
          icon: const Icon(Icons.contacts),
          title: 'Contact Us',
          onPressed: contactUsByEmail,
        ),
        CustomDrawerItem(
          icon: const Icon(Icons.logout),
          title: 'Logout',
          onPressed: () async {
            await SupabaseAuthService().signOut();
            GoRouter.of(context).pushReplacement(LoginView.routeName);
          },
        ),
      ],
    );
  }
}
