import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

Future<void> dialogBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
            content: Container(
              height: 128.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 64.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: AppColors.purplePrimary,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 32,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    'Transaction has been successfully added',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ));
}
