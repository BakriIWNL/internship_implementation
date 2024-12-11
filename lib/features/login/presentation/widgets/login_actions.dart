import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: context.localizations.logIn,
          onPressed: () => {context.go(RouteNames.signUp)},
          size: Size(343.w, 56.h),
        ),
        33.verticalSpace,
        InkWell(
          onTap: () {
            context.go(RouteNames.forgotPassword);
          },
          child: Text(
            context.localizations.forgotPasswordQ,
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.purplePrimary),
          ),
        ),
        38.verticalSpace,
        RichText(
          text: TextSpan(
            text: context.localizations.dontHave,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyText,
            ),
            children: [
              TextSpan(
                text: context.localizations.signUp,
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
    );
  }
}
