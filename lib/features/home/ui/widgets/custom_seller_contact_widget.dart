import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSellerContactWidget extends StatefulWidget {
  const CustomSellerContactWidget({super.key, required this.carModel});
  final CarModel carModel;

  @override
  State<CustomSellerContactWidget> createState() =>
      _CustomSellerContactWidgetState();
}

class _CustomSellerContactWidgetState extends State<CustomSellerContactWidget> {
  Future<void> _callSeller() async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '+20${widget.carModel.sellerPhone}',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch phone dialer');
    }
  }

  Future<void> _whatsappSeller() async {
    final String sanitizedNumber = '+2${widget.carModel.sellerPhone}'
        .replaceAll('+', '')
        .replaceAll(' ', '');
    final whatsappUrl = Uri.parse("https://wa.me/$sanitizedNumber");
    print(whatsappUrl);

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch WhatsApp');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.veryDarkGreyColor,
            border: Border.all(color: AppColors.darkGreyColor),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: _callSeller,
            icon: const Icon(Icons.call),
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: _whatsappSeller,
          child: Image.asset(
            Assets.imagesIcons8Whatsapp50,
            color: Colors.white,
            height: 35.h,
          ),
        ),
      ],
    );
  }
}
