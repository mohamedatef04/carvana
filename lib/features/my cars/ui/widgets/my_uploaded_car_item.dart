import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/explore/ui/widgets/icon_text.dart';
import 'package:carvana/features/my%20cars/logic/cubits/my_uploaded_cars/my_uploaded_cars_cubit.dart';
import 'package:carvana/features/my%20cars/ui/views/edit_my_car_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyUploadedCarItem extends StatelessWidget {
  const MyUploadedCarItem({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.h),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: AppColors.veryDarkGreyColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: MediaQuery.sizeOf(context).width * 0.12,
              child: CachedNetworkImage(
                imageUrl: carModel.carImage1!,
                width: 290.w,
                height: 180.h,

                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
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
            width: MediaQuery.sizeOf(context).width,
            height: 110.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: AppColors.blackColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              '₹ ${carModel.carNumberOfLitresBer100Km} L',
                              style: AppStyles.white16.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          carModel.sellerName,
                          style: AppStyles.white16.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      carModel.carModel,
                      style: AppStyles.white16.copyWith(fontSize: 18.sp),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              IconText(
                                icon: Icons.precision_manufacturing_sharp,
                                text: '${carModel.carEngine} cc',
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            children: [
                              IconText(
                                icon: Icons.ev_station,
                                text: carModel.carTransmission,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              IconText(
                                icon: Icons.flash_on,
                                text: '${carModel.carMaxSpeed} km/h',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                final res = await GoRouter.of(
                  context,
                ).push<bool>(EditMyCarView.routeName, extra: carModel);

                if (res == true) {
                  context.read<MyUploadedCarsCubit>().getMyUploadedCars();
                }
              },
              child: Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.darkGreyColor,
                ),
                child: Center(
                  child: Text(
                    'Edit',
                    style: AppStyles.white16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.read<MyUploadedCarsCubit>().deleteMyUploadedCar(
                  carId: carModel.carId!,
                );
              },
              child: Container(
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  color: AppColors.darkGreyColor,
                ),
                child: Center(
                  child: Text(
                    'Delete',
                    style: AppStyles.white16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
