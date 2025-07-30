import 'package:carvana/core/models/car_model.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/my%20cars/logic/cubits/my_uploaded_cars/my_uploaded_cars_cubit.dart';
import 'package:carvana/features/my%20cars/ui/widgets/my_uploaded_car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyUploadedCarsList extends StatelessWidget {
  const MyUploadedCarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyUploadedCarsCubit, MyUploadedCarsState>(
      builder: (context, state) {
        if (state is MyUploadedCarsLoaded) {
          return ListView.builder(
            itemCount: state.carsList.length,
            itemBuilder: (context, index) {
              return MyUploadedCarItem(carModel: state.carsList[index]);
            },
          );
        } else if (state is MyUploadedCarsAfterDelete) {
          return ListView.builder(
            itemCount: state.carsList.length,
            itemBuilder: (context, index) {
              return MyUploadedCarItem(carModel: state.carsList[index]);
            },
          );
        } else if (state is MyUploadedCarsError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is MyUploadedCarsEmpty) {
          return Center(
            child: Text(
              'No cars uploaded yet',
              style: AppStyles.black20.copyWith(color: Colors.white),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Skeletonizer(
                enabled: true,
                child: MyUploadedCarItem(carModel: CarModel.placeholder()),
              );
            },
          );
        }
      },
    );
  }
}
