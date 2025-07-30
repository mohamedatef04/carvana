import 'package:carvana/core/functions/show_snak_bar.dart';
import 'package:carvana/core/theme/app_colors.dart';
import 'package:carvana/core/theme/app_styles.dart';
import 'package:carvana/features/auth/data/models/user_model.dart';
import 'package:carvana/features/auth/logic/cubits/signup%20cubit/sign_up_cubit.dart';
import 'package:carvana/features/auth/ui/widgets/custom_address_textfield.dart';
import 'package:carvana/features/auth/ui/widgets/custom_already_have_an_account_widget.dart';
import 'package:carvana/features/auth/ui/widgets/custom_confirm_password_text_field.dart';
import 'package:carvana/features/auth/ui/widgets/custom_email_textfield.dart';
import 'package:carvana/features/auth/ui/widgets/custom_first_and_last_name_widget.dart';
import 'package:carvana/features/auth/ui/widgets/custom_phone_text_field.dart';
import 'package:carvana/features/auth/ui/widgets/custom_signup_password_textfield.dart';
import 'package:carvana/features/home/ui/views/main_home_view.dart';
import 'package:carvana/features/onboarding/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          GoRouter.of(context).pushReplacement(MainHomeView.routeName);
        } else if (state is SignUpFailure) {
          showSnakBar(
            context,
            message: state.errorMessage,
            color: AppColors.whiteColor,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        spacing: 20.h,

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Create Account', style: AppStyles.white36),
                              Text(
                                'Sign up to continue',
                                style: AppStyles.black24.copyWith(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ],
                          ),
                          CustomFirstAndLastNameWidget(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                          ),

                          CustomEmailTextField(
                            emailController: emailController,
                          ),
                          CustomPhoneTextField(
                            phoneController: phoneNumberController,
                          ),
                          CustomAddressTextfield(
                            addressController: addressController,
                          ),
                          CustomSignupPasswordTextField(
                            passwordController: passwordController,
                          ),
                          CustomConfirmPasswordTextField(
                            confirmPasswordController:
                                confirmPasswordController,
                          ),

                          CustomElevatedButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.read<SignUpCubit>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  userModel: UserModel(
                                    firstName: firstNameController.text.trim(),
                                    lastName: lastNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    phone: phoneNumberController.text.trim(),
                                    address: addressController.text.trim(),
                                  ),
                                );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          ),
                          const CustomAlreadyHaveAnAccountWidget(),
                        ],
                      ),
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
