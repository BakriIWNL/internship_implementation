import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/expandable_fab/action_button_builder.dart';
import 'package:itcores_internship_project/core/components/expandable_fab/expandable_fab.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class CustomExpandableFab extends StatelessWidget {
  const CustomExpandableFab({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      pos: ExpandableFabPos.center,
      type: ExpandableFabType.fan,
      overlayStyle: ExpandableFabOverlayStyle(
        color: AppColors.purplePrimaryOpaque,
      ),
      distance: 80.sp,
      // childrenOffset: const Offset(0, 200),
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: Icon(
          Icons.add,
          size: 32.sp,
        ),
        fabSize: ExpandableFabSize.regular,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.purplePrimary,
        shape: const CircleBorder(),
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        size: 56.sp,
        builder: (BuildContext context, void Function()? onPressed,
            Animation<double> progress) {
          return Container(
            width: 56.sp,
            height: 56.sp,
            decoration: BoxDecoration(
              color: AppColors.purplePrimary,
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
            ),
            child: Icon(
              Icons.close,
              size: 40.sp,
              color: AppColors.white,
            ),
          );
        },
      ),
      fanAngle: 120,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Container(
            width: 56.sp,
            height: 56.sp,
            decoration: BoxDecoration(
              color: AppColors.greenPrimary,
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
            ),
            child: Icon(
              Icons.close,
              size: 40.sp,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: Container(
            width: 56.sp,
            height: 56.sp,
            decoration: BoxDecoration(
              color: AppColors.bluePrimary,
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
            ),
            child: Icon(
              Icons.close,
              size: 40.sp,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Container(
            width: 56.sp,
            height: 56.sp,
            decoration: BoxDecoration(
              color: AppColors.redPrimary,
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
            ),
            child: Icon(
              Icons.close,
              size: 40.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
