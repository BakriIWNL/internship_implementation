import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          76.verticalSpace,
          Image.asset(
            AppAssets.emailSent,
            height: 312.h,
            width: 312.w,
          ),
          18.verticalSpace,
          Text(
            context.localizations.emailOnTheWay,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          24.verticalSpace,
          Text(
            context.localizations.checkEmail,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          190.verticalSpace,
          CustomButton(
              text: context.localizations.backToLogin,
              onPressed: () {
                context.go(RouteNames.login);
              },
              size: Size(343.w, 56.h))
        ],
      ),
    );
  }
}
