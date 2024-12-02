import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/login/presentation/cubit/login_cubit.dart';
import 'package:itcores_internship_project/features/signup/presentation/cubits/signup/signup_cubit.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/checkbox.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

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
              AppStrings.logIn,
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
                      hint: AppStrings.email,
                      controller: context.read<SignupCubit>().nameController,
                      validationType: AppStrings.email,
                      height: 56.h,
                      width: 343.w,
                      password: false,
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return NewCustomTextField(
                          hint: AppStrings.password,
                          controller: context.read<SignupCubit>().passwordController,
                          validationType: AppStrings.password,
                          height: 56.h,
                          width: 343.w,
                          icon: state.isPasswordVisible
                              ? IconButton(
                                  onPressed: () {
                                    context
                                        .read<LoginCubit>()
                                        .togglePasswordVisibility();
                                  },
                                  icon: AppIcons.invisible,
                                  color: AppColors.greyPrimary,
                                )
                              : IconButton(
                                  onPressed: () {
                                    context
                                        .read<LoginCubit>()
                                        .togglePasswordVisibility();
                                  },
                                  icon: AppIcons.visible,
                                  color: AppColors.greyPrimary),
                          password: true,
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    text: AppStrings.logIn,
                    onPressed: () => {context.go(RouteNames.signUp)},
                    size: Size(343.w, 56.h),
                  ),
                  19.verticalSpace,
                  Text(AppStrings.forgotPassword,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
                  RichText(
                    text: TextSpan(
                      text: AppStrings.dontHave,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyText,
                      ),
                      children: [
                        TextSpan(
                          text: AppStrings.signUp,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purplePrimary,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go(RouteNames.signUp);
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
