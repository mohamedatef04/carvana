import 'package:cached_network_image/cached_network_image.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarDetailsImage extends StatefulWidget {
  const CustomCarDetailsImage({super.key, required this.carModel});

  final CarModel carModel;

  @override
  State<CustomCarDetailsImage> createState() => _CustomCarDetailsImageState();
}

class _CustomCarDetailsImageState extends State<CustomCarDetailsImage> {
  late List<String> images;

  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    images = [
      widget.carModel.carImage1!,
      widget.carModel.carImage2!,
      widget.carModel.carImage3!,
      widget.carModel.carImage4!,
      widget.carModel.carImage5!,
      widget.carModel.carImage6!,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        SizedBox(
          height: 220.h,
          child: PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: images[index],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: 6,
          effect: const ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            dotColor: Colors.grey,
            activeDotColor: Colors.amber,
          ),
        ),
      ],
    );
  }
}
