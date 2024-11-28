import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/utils/validationconditions.dart';

class NewCustomTextField extends StatelessWidget {
  const NewCustomTextField({super.key, required this.hint, required this.controller,this.obscure = false, required this.validationType,this.icon});
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final String validationType;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: obscure,
      controller: controller,
      validator: ValidationConditions.validator[validationType],
      decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          hintText: hint,
          contentPadding: EdgeInsets.only(top: 12.h),
          suffixIcon: icon ?? const Icon(
            Icons.arrow_back_ios, color: Colors.transparent),
        errorStyle: TextStyle(fontSize: 13.sp),
      ),
    );
  }
}
