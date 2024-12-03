import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/cubit/language_cubit.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/checkbox.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/signup_buttons.dart';
import 'package:itcores_internship_project/features/signup/presentation/widgets/signup_text_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.signUp,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(top: 35.h,right: 20.w,left: 20.w),
                  child: SizedBox(
                    height: 50.h,
                    width: 50.h,
                    child: DropdownButton(
                      underline: const SizedBox(),
                      iconEnabledColor: AppColors.black,
                      elevation: 1,
                      menuWidth: 60.w,
                      dropdownColor: AppColors.white,
                      items: const [
                      DropdownMenuItem(value: 0,child: Text("EN"),),
                      DropdownMenuItem(value: 1,child: Text("AR"),)
                    ], onChanged: (value) {
                      context.read<LanguageCubit>().changeMenuIndex(value as int);
                      if(value == 0){
                        context.read<LanguageCubit>().changeLanguage(const Locale('en'));
                        return;
                      }else{
                        context.read<LanguageCubit>().changeLanguage(const Locale('ar'));
                      }
                    },value: context.read<LanguageCubit>().state.menuIndex,),
                  ),
                );
              },
            )
          ],
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
                      text: AppLocalizations.of(context)!.alreadyHaveAccount,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyText,
                      ),
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.logIn,
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
