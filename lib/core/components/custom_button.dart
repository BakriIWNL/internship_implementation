import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Size size;
  final Color textColor;
  final Color backgroundColor;

  const CustomButton({super.key,required this.text, required this.onPressed,required this.size,this.textColor = AppColors.white,this.backgroundColor = AppColors.purplePrimary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: size,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text,
          style: TextStyle(
              color: textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600)),
    );
  }
}
