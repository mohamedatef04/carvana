import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/features/explore/ui/widgets/car_image_widget.dart';
import 'package:carvana/features/explore/ui/widgets/car_information_card_widget.dart';
import 'package:carvana/features/home/ui/views/car_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(CarDetailsView.routeName, extra: carModel);
      },
      child: Column(
        children: [
          Stack(children: [CarImageWidget(carModel: carModel)]),

          CarInformationCardWidget(carModel: carModel),
        ],
      ),
    );
  }
}
