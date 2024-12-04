import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/setup/setup_cubit.dart';
class NumpadButton extends StatelessWidget {
  final int number;
  final TextEditingController controller;

  const NumpadButton({super.key, required this.number, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(!context.read<SetupCubit>().checkComplete(controller.text.length)){
          controller.text += number.toString();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purplePrimary,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w500, color: AppColors.white),
      ),
    );
  }
}
