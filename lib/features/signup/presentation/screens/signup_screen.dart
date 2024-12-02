import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/components/purple_button.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/signup/presentation/cubits/signup/signup_cubit.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/checkbox.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 64.h),
        child: AppBar(
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackText,
          ),
          leading: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: IconButton(
              icon: AppIcons.arrowBack,
              onPressed: () {
                context.go(RouteNames.onboarding);
              },
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Text(
              AppStrings.signUp,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  56.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: NewCustomTextField(
                      hint: AppStrings.name,
                      controller: context.read<SignupCubit>().nameController,
                      validationType: AppStrings.name,
                      height: 56.h,
                      width: 343.w,
                      password: false,
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: NewCustomTextField(
                      hint: AppStrings.email,
                      controller: context.read<SignupCubit>().emailController,
                      validationType: AppStrings.email,
                      height: 56.h,
                      width: 343.w,
                      password: false,
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: BlocBuilder<SignupCubit, SignupState>(
                      builder: (context, state) {
                        return NewCustomTextField(
                          hint: AppStrings.password,
                          controller:
                              context.read<SignupCubit>().passwordController,
                          validationType: AppStrings.password,
                          height: 56.h,
                          width: 343.w,
                          icon: !context.read<SignupCubit>().passwordVisible
                              ? IconButton(
                                  onPressed: () {
                                    context
                                        .read<SignupCubit>()
                                        .togglePasswordVisibility();
                                  },
                                  icon: AppIcons.invisible,
                                  color: AppColors.greyPrimary,
                                )
                              : IconButton(
                                  onPressed: () {
                                    context
                                        .read<SignupCubit>()
                                        .togglePasswordVisibility();
                                  },
                                  icon: AppIcons.visible,
                                  color: AppColors.greyPrimary),
                          password: true,
                        );
                      },
                    ),
                  ),
                  const CheckBox(),
                  PurpleButton(
                      text: AppStrings.signUp,
                      onPressed: () => {context.go(RouteNames.signUp)},
                      size: Size(343.w, 56.h)),
                  12.verticalSpace,
                  Text(AppStrings.orWith,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.greyText,
                      )),
                  12.verticalSpace,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: (Size(343.w, 56.h)),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () {
                      context.go(RouteNames.signUp);
                    },
                    child: Row(
                      children: [
                        20.horizontalSpace,
                        Image.asset(
                          AppAssets.googleLogo,
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 35.w,
                        ),
                        10.horizontalSpace,
                        Text(AppStrings.googleSignUp,
                            style: TextStyle(
                                color: AppColors.blackText,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                  19.verticalSpace,
                  RichText(
                    text: TextSpan(
                      text: AppStrings.alreadyHaveAccount,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyText,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.logIn,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purplePrimary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(RouteNames.login);
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
