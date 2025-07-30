import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/home/ui/views/car_details.dart';
import 'package:carvana/features/home/ui/widgets/bottom_card_widget.dart';
import 'package:carvana/features/home/ui/widgets/custom_add_to_wishlist_widget.dart';
import 'package:carvana/features/home/ui/widgets/top_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(CarDetailsView.routeName, extra: carModel);
          },
          child: Stack(
            children: [
              const TopCardWidget(),
              Positioned(
                top: 90.h,
                left: MediaQuery.of(context).size.width * 0.85,
                child: CustomAddToWishlistWidget(carModel: carModel),
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
        ),

        BottomCardWidget(carModel: carModel),
      ],
    );
  }
}
