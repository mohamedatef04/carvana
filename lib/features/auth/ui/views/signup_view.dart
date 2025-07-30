import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/auth/data/repos/auth_repo_impl.dart';
import 'package:carvana/features/auth/logic/cubits/signup%20cubit/sign_up_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup-view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
        ),
      ],

      child: const Scaffold(
        body: SignupViewBody(),
      ),
    );
  }
}
