import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/features/login/presentation/widgets/login_actions.dart';
import 'package:itcores_internship_project/features/login/presentation/widgets/login_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              context.localizations.logIn,
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
                  const LoginForm(),
                  40.verticalSpace,
                  const LoginActions(),
                ],
              ),
            )),
      ),
    );
  }
}
