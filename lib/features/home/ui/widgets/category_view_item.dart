import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';

import 'package:carvana/features/explore/ui/widgets/icon_text.dart';
import 'package:carvana/features/home/ui/views/car_details.dart';
import 'package:carvana/features/home/ui/widgets/custom_add_to_wishlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoryViewItem extends StatelessWidget {
  const CategoryViewItem({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(CarDetailsView.routeName, extra: carModel);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: 130.h,
                  decoration: BoxDecoration(
                    color: AppColors.veryVeryDarkGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: carModel.carImage1!,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ],
          ),

          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),

            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: AppColors.blackColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹ ${carModel.carNumberOfLitresBer100Km} L ',
                          style: AppStyles.white16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomAddToWishlistWidget(carModel: carModel),
                      ],
                    ),
                    Text(
                      carModel.carModel,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.white16.copyWith(fontSize: 14.sp),
                    ),
                    const Divider(),
                    Row(
                      spacing: 5.w,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconText(
                          icon: Icons.precision_manufacturing_sharp,
                          text: "${carModel.carEngine} cc",
                        ),

                        IconText(
                          icon: Icons.ev_station,
                          text: '${carModel.carTransmission} ',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconText(
                          icon: Icons.flash_on,
                          text: '${carModel.carMaxSpeed} km/h',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
