import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/home/data/repos/home_repo_impl.dart';
import 'package:carvana/features/home/logic/cubits/get_car_seller_image_cubit.dart';
import 'package:carvana/features/home/ui/widgets/car_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carModel});
  static const routeName = '/car_details-view';

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCarSellerImageCubit(getIt.get<HomeRepoImpl>()),
      child: Scaffold(body: CarDetailsViewBody(carModel: carModel)),
    );
  }
}
