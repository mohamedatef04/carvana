import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/logic/cubits/login%20cubit/login_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/custom_dont_have_an_account_widget.dart';
import 'package:carvana/features/auth/ui/widgets/custom_email_textfield.dart';
import 'package:carvana/features/auth/ui/widgets/custom_forget_password_widget.dart';
import 'package:carvana/features/auth/ui/widgets/custom_password_textfield.dart';
import 'package:carvana/features/home/ui/views/main_home_view.dart';
import 'package:carvana/features/onboarding/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(MainHomeView.routeName);
        } else if (state is LoginFailure) {
          showSnakBar(
            context,
            message: 'Invalid email or password',
            color: AppColors.whiteColor,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          child: Scaffold(
            body: SafeArea(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      spacing: 15.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Welcome Back', style: AppStyles.white36),
                            Text(
                              'Sign in to continue',
                              style: AppStyles.black24.copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),
                          ],
                        ),

                        CustomEmailTextField(emailController: emailController),
                        CustomPasswordTextField(
                          passwordController: passwordController,
                        ),

                        const CustomForgetPasswordWidget(),

                        CustomElevatedButton(
                          text: 'Sign In',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.read<LoginCubit>().login(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                        const CustomDontHaveAnAccountWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
