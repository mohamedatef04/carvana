import 'package:carvana/core/widgets/custom_app_bar.dart';
import 'package:carvana/features/my%20cars/logic/cubits/my_uploaded_cars/my_uploaded_cars_cubit.dart';
import 'package:carvana/features/my%20cars/ui/widgets/my_uploaded_cars_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyUploadedCarsViewBody extends StatefulWidget {
  const MyUploadedCarsViewBody({super.key});

  @override
  State<MyUploadedCarsViewBody> createState() => _MyUploadedCarsViewBodyState();
}

class _MyUploadedCarsViewBodyState extends State<MyUploadedCarsViewBody> {
  @override
  void initState() {
    context.read<MyUploadedCarsCubit>().getMyUploadedCars();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'My Uploaded Cars',
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(true);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: const MyUploadedCarsList(),
    );
  }
}
