import 'package:carvana/core/services/get_it_service.dart';
import 'package:carvana/features/auth/data/repos/auth_repo_impl.dart';
import 'package:carvana/features/auth/logic/cubits/login%20cubit/login_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = '/login-view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
