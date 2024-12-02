import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/validationconditions.dart';

class NewCustomTextField extends StatelessWidget {
  const NewCustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.validationType,
      this.icon,
      required this.height,
      required this.password,
      required this.width});

  final String hint;
  final TextEditingController controller;
  final String validationType;
  final dynamic icon;
  final double height;
  final double width;
  final bool password;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TextFormField(
        obscureText: (password) ? false : true,
        autocorrect: false,
        controller: controller,
        cursorColor: AppColors.greyPrimary,
        style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackText,
            fontWeight: FontWeight.w400),
        validator: ValidationConditions.validator[validationType],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.greyPrimary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.redPrimary),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.redPrimary),
          ),
          hintStyle: TextStyle(
              fontSize: 16.sp,
              color: AppColors.greyText,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.greyPrimary),
          ),
          hintText: hint,
          contentPadding: EdgeInsets.only(top: 8.h, left: 8.w),
          suffixIcon: icon ??
              const Icon(Icons.arrow_back_ios, color: Colors.transparent),
          errorStyle: TextStyle(fontSize: 13.sp),
        ),
      ),
    );
  }
}
