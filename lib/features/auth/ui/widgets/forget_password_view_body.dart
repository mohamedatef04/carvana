import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/logic/cubits/reset%20password%20cubit/reset_password_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/custom_email_textfield.dart';
import 'package:carvana/features/onboarding/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              spacing: 20.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Reset Your Password', style: AppStyles.white36),
                CustomEmailTextField(emailController: emailController),

                CustomElevatedButton(
                  text: 'Reset Password',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      context.read<ResetPasswordCubit>().resetPassword(
                        email: emailController.text,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
