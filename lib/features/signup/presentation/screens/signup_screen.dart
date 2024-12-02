import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/checkbox.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/signup_buttons.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/signup_text_fields.dart';

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
                  const SignupTextFields(),
                  const CheckBox(),
                  const SignUpButtons(),
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
