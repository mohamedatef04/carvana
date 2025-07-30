import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/my%20cars/data/repos/my_cars_repo_impl.dart';
import 'package:carvana/features/my%20cars/logic/cubits/my_uploaded_cars/my_uploaded_cars_cubit.dart';
import 'package:carvana/features/my%20cars/ui/widgets/my_uploaded_cars_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class MyUploadedCarsView extends StatelessWidget {
  const MyUploadedCarsView({super.key});
  static const routeName = '/my-uploaded-cars-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyUploadedCarsCubit(getIt.get<MyCarsRepoImpl>()),
        ),
      ],
      child: Scaffold(
        body: BlocConsumer<MyUploadedCarsCubit, MyUploadedCarsState>(
          listener: (context, state) {
            if (state is DeleteMyUploadedCarFailure) {
              showSnakBar(
                context,
                message: state.errorMessage,
                color: AppColors.whiteColor,
              );
            } else if (state is DeleteMyUploadedCarSuccess) {
              showSnakBar(
                context,
                message: 'Car deleted successfully',
                color: AppColors.whiteColor,
              );
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is LoadingMyUploadedCarAfterDelete,
              child: const MyUploadedCarsViewBody(),
            );
          },
        ),
      ),
    );
  }
}
