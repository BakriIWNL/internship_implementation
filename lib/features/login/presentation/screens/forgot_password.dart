import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/login/presentation/cubit/forgot_password/forgotpassword_cubit.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

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
                context.go(RouteNames.login);
              },
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Text(
              AppStrings.forgotPassword,
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
                  SizedBox(
                      width: 343.w,
                      height: 150.h,
                      child: Text(
                        AppStrings.dontWorry,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600),
                            maxLines: 5,
                      )),
                  46.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: NewCustomTextField(
                      hint: AppStrings.email,
                      controller:
                          context.read<ForgotpasswordCubit>().emailController,
                      validationType: AppStrings.email,
                      height: 56.h,
                      width: 343.w,
                      password: false,
                    ),
                  ),
                  40.verticalSpace,
                  CustomButton(
                    text: AppStrings.continueText,
                    onPressed: () => {context.go(RouteNames.emailSent)},
                    size: Size(343.w, 56.h),
                  ),
                  33.verticalSpace,
                ],
              ),
            )),
      ),
    );
  }
}
