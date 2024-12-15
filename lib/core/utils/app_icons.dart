import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class AppIcons{
  static Icon arrowBack = Icon(Icons.arrow_back_ios,size: 24.sp,);
  static Icon arrowBackWhite = Icon(Icons.arrow_back_ios,size: 24.sp,color:AppColors.white ,);
  static Icon visible = const Icon(Icons.visibility_off_outlined);
  static Icon invisible = const Icon(Icons.visibility_outlined);
  static Icon profile = const Icon(Icons.person,color: AppColors.purplePrimary,);
  static Icon add =  Icon(Icons.add,size: 40.sp,);
}