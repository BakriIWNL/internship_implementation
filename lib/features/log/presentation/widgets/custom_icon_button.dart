import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Size size;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;

  const CustomIconButton({super.key,required this.text, required this.onPressed,required this.size,this.textColor = AppColors.white,this.backgroundColor = AppColors.purplePrimary, required this.icon});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.bottomNavBar,
      strokeWidth: 3.w,
      child: ElevatedButton(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.greyText,size: 32.sp,),
            10.horizontalSpace,
            Text(text,
                style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
