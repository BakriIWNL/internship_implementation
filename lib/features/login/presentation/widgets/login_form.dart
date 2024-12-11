import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/login/presentation/cubit/login/login_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        56.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: NewCustomTextField(
            hint: context.localizations.email,
            controller: context.read<LoginCubit>().emailController,
            validationType: AppStrings.email,
            height: 56.h,
            width: 343.w,
            password: false,
          ),
        ),
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return NewCustomTextField(
                hint: context.localizations.password,
                controller: context.read<LoginCubit>().passwordController,
                validationType: AppStrings.password,
                height: 56.h,
                width: 343.w,
                icon: state.isPasswordVisible
                    ? IconButton(
                        onPressed: () {
                          context.read<LoginCubit>().togglePasswordVisibility();
                        },
                        icon: AppIcons.invisible,
                        color: AppColors.greyPrimary,
                      )
                    : IconButton(
                        onPressed: () {
                          context.read<LoginCubit>().togglePasswordVisibility();
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
