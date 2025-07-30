import 'package:carvana/features/profile/ui/widgets/custom_profile_listtile.dart';
import 'package:carvana/features/profile/ui/widgets/logout_widget.dart';
import 'package:carvana/features/profile/ui/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileColumnWidgetShimmer extends StatelessWidget {
  const CustomProfileColumnWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        ProfileImageWidget(imageUrl: ''),
        CustomProfileListtile(
          leadingIcon: Icon(Icons.person, size: 30, color: Colors.grey),
          title: 'UserName',
          subtitle: '',
          trailingIcon: Icon(Icons.edit, size: 20, color: Colors.grey),
        ),
        CustomProfileListtile(
          leadingIcon: Icon(Icons.email, size: 30, color: Colors.grey),
          title: 'Email',
          subtitle: '',
          trailingIcon: Icon(Icons.edit, size: 20, color: Colors.grey),
        ),
        CustomProfileListtile(
          leadingIcon: Icon(Icons.phone, size: 30, color: Colors.grey),
          title: 'Phone Number',
          subtitle: '',
          trailingIcon: Icon(Icons.edit, size: 20, color: Colors.grey),
        ),
        CustomProfileListtile(
          leadingIcon: Icon(Icons.location_on, size: 30, color: Colors.grey),
          title: 'Address',
          subtitle: '',
          trailingIcon: Icon(Icons.edit, size: 20, color: Colors.grey),
        ),
        LogoutWidget(),
      ],
    );
  }
}
