import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class LightPurpleButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Size size;

  const LightPurpleButton({super.key,required this.text, required this.onPressed,required this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: AppColors.purpleSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text,
          style: TextStyle(
              color: AppColors.purplePrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600)),
    );
  }
}
