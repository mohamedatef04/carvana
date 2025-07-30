import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/my%20cars/data/repos/my_cars_repo_impl.dart';
import 'package:carvana/features/my%20cars/logic/cubits/edit_my_uploaded_car/edit_my_uploaded_car_cubit.dart';
import 'package:carvana/features/my%20cars/ui/widgets/edit_my_car_view_body.dart';
import 'package:carvana/features/sell%20car/data/repos/car_images_repo_impl.dart';
import 'package:carvana/features/sell%20car/logic/cubits/carimagescubit/carimagescubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditMyCarView extends StatelessWidget {
  const EditMyCarView({super.key, required this.carModel});
  static const routeName = '/edit-my-car';

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CarImagesCubit(getIt.get<CarImagesRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              EditMyUploadedCarCubit(getIt.get<MyCarsRepoImpl>()),
        ),
      ],
      child: BlocConsumer<EditMyUploadedCarCubit, EditMyUploadedCarState>(
        listener: (context, state) {
          if (state is EditMyUploadedCarSuccess) {
            showSnakBar(
              context,
              message: 'Car edited successfully',
              color: AppColors.whiteColor,
            );
            context.pop(true);
          } else if (state is EditMyUploadedCarFailure) {
            showSnakBar(
              context,
              message: state.errorMessage,
              color: AppColors.whiteColor,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(body: EditMyCarViewBody(carModel: carModel));
        },
      ),
    );
  }
}
