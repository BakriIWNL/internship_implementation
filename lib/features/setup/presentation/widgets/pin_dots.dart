import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/setup/setup_cubit.dart';
import 'package:itcores_internship_project/features/setup/presentation/widgets/custom_pin_dots.dart';

class PinDots extends StatelessWidget {
  const PinDots({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: BlocBuilder<SetupCubit, SetupState>(
        builder: (context, state) {
          return CustomPinDot(
            size: 32.r,
            length: 4,
            activeColor: AppColors.white,
            borderColor: AppColors.purpleTertiary,
            inactiveColor: AppColors.purplePrimary,
            controller: context.read<SetupCubit>().pinController,
          );
        },
      ),
    );
  }
}
