import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomButton(
            text: AppLocalizations.of(context)!.signUp,
            onPressed: () => {context.go(RouteNames.enterPin)},
            size: Size(343.w, 56.h)),
        12.verticalSpace,
        Text(AppLocalizations.of(context)!.orWith,
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
              Text(AppLocalizations.of(context)!.googleSignUp,
                  style: TextStyle(
                      color: AppColors.blackText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
