import 'package:ecommerce_c17_online/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_online/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_c17_online/di.dart';
import 'package:ecommerce_c17_online/features/auth/domain/entity/SignUpRequest.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_events.dart';
import 'package:ecommerce_c17_online/features/auth/presentation/bloc/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocConsumer<AuthBloc, AuthStates>(
          listener: (context, state) {
            if (state.signUpRequestStatus == RequestStatus.failure) {
              showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(title: Text(state.signUpErrorMessage??"")),
              );
            }

            if (state.signUpRequestStatus == RequestStatus.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            }
            if (state.signUpRequestStatus == RequestStatus.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: ColorManager.primary,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppSize.s40.h),
                          Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                          SizedBox(height: AppSize.s40.h),
                          BuildTextField(
                            backgroundColor: ColorManager.white,
                            hint: 'enter your full name',
                            label: 'Full Name',

                            controller: nameController,
                            textInputType: TextInputType.name,
                            validation: AppValidators.validateFullName,
                          ),
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            hint: 'enter your mobile no.',
                            backgroundColor: ColorManager.white,
                            label: 'Mobile Number',
                            controller: phoneController,
                            validation: AppValidators.validatePhoneNumber,
                            textInputType: TextInputType.phone,
                          ),
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            hint: 'enter your email address',
                            backgroundColor: ColorManager.white,
                            label: 'E-mail address',
                            controller: emailController,
                            validation: AppValidators.validateEmail,
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: AppSize.s18.h),
                          BuildTextField(
                            hint: 'enter your password',
                            backgroundColor: ColorManager.white,
                            label: 'password',
                            validation: AppValidators.validatePassword,
                            isObscured: true,
                            controller: passwordController,
                            textInputType: TextInputType.text,
                          ),
                          SizedBox(height: AppSize.s50.h),
                          Center(
                            child: SizedBox(
                              height: AppSize.s60.h,
                              width: MediaQuery.of(context).size.width * .9,
                              child: CustomElevatedButton(
                                // borderRadius: AppSize.s8,
                                label: 'Sign Up',
                                backgroundColor: ColorManager.white,
                                textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20,
                                ),
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    SignUpRequest request = SignUpRequest(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      rePassword: passwordController.text,
                                    );
                                    context.read<AuthBloc>().add(
                                      SignUpEvent(request),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
