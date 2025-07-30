import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/features/auth/data/repos/auth_repo_impl.dart';
import 'package:carvana/features/auth/logic/cubits/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = '/forget-password-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.pop(context);
            showSnakBar(
              context,
              message: 'Check your email',
              color: AppColors.whiteColor,
            );
          } else if (state is ResetPasswordFailure) {
            showSnakBar(
              context,
              message: state.errorMessage,
              color: AppColors.whiteColor,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: state is ResetPasswordLoading,
              child: const ForgetPasswordViewBody(),
            ),
          );
        },
      ),
    );
  }
}
