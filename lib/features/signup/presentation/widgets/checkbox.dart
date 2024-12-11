import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/signup/presentation/cubits/signup/signup_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 16.w, right: 20.w,top: 17.h,bottom: 27.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r)),
                activeColor: AppColors.purplePrimary,
                checkColor: AppColors.white,
                focusColor: AppColors.purplePrimary,
                value: state.isCheckboxChecked,
                onChanged: (value) {
                  context.read<SignupCubit>().toggleCheckBox();
                },
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                      text: context.localizations.signUpAgree,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackText,
                      ),
                      children: [
                        TextSpan(
                          text: context.localizations.termsAndConditions,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              Uri url =
                                  context.localizations.termsAndConditionsLink as Uri;
                              if (!await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch $url');
                              }
                            },
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.purplePrimary,
                          ),
                        ),
                      ]),
                  maxLines: null,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
