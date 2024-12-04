import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SheetScreen extends StatelessWidget {
  final BottomSheet bottomSheet;

  const SheetScreen({super.key, required this.bottomSheet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheet,
      backgroundColor: AppColors.purplePrimary,
      appBar: AppBar(
        backgroundColor: AppColors.purplePrimary,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: IconButton(
            icon: AppIcons.arrowBackWhite,
            onPressed: () {
              context.go(RouteNames.onboarding);
            },
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            AppLocalizations.of(context)!.newAccount,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                320.verticalSpace,
                Text(AppLocalizations.of(context)!.balance,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: AppColors.purpleTertiary)),
                10.verticalSpace,
                Text("\$00.0",
                    style: TextStyle(fontSize: 64.sp, fontWeight: FontWeight.w600, color: AppColors.white)),
              ],
            ),
          )),
    );
  }
}
