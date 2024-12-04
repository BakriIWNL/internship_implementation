import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/signup/presentation/cubits/signup/signup_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupTextFields extends StatelessWidget {
  const SignupTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: NewCustomTextField(
            hint: AppLocalizations.of(context)!.name,
            controller: context.read<SignupCubit>().nameController,
            validationType: AppStrings.name,
            height: 56.h,
            width: 343.w,
            password: false,
          ),
        ),
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: NewCustomTextField(
            hint: AppLocalizations.of(context)!.email,
            controller: context.read<SignupCubit>().emailController,
            validationType: AppStrings.email,
            height: 56.h,
            width: 343.w,
            password: false,
          ),
        ),
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return NewCustomTextField(
                hint: AppLocalizations.of(context)!.password,
                controller: context.read<SignupCubit>().passwordController,
                validationType: AppStrings.password,
                height: 56.h,
                width: 343.w,
                icon: !state.isPasswordVisible
                    ? IconButton(
                        onPressed: () {
                          context
                              .read<SignupCubit>()
                              .togglePasswordVisibility();
                        },
                        icon: AppIcons.invisible,
                        color: AppColors.greyPrimary,
                      )
                    : IconButton(
                        onPressed: () {
                          context
                              .read<SignupCubit>()
                              .togglePasswordVisibility();
                        },
                        icon: AppIcons.visible,
                        color: AppColors.greyPrimary),
                password: state.isPasswordVisible,
              );
            },
          ),
        ),
      ],
    );
  }
}
