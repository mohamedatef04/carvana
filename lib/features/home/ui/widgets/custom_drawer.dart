import 'package:carvana/features/home/ui/widgets/custom_drawer_general_setting_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_drawer_support_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_drawer_user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 40.h),
        child: Column(
          spacing: 20.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomDrawerUserInfoWidget(),

            Divider(),

            CustomDrawerGeneralSettingWidget(),

            CustomDrawerSupportWidget(),
          ],
        ),
      ),
    );
  }
}
