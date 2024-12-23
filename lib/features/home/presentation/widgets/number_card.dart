import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumberCard extends StatelessWidget {
  final Color color;
  final int number;
  final String type;

  const NumberCard(
      {super.key,
      required this.color,
      required this.number,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 164.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Center(
                child: Icon(
              (type == AppLocalizations.of(context)!.income) ? Icons.arrow_drop_down : Icons.arrow_upward,
              size: 24.sp,color: color,
            )),
          ),
          5.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: AppColors.white),
              ),
              Text(
                    "\$$number",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: AppColors.white),
                  ),
            ],
          )
        ],
      ),
    );
  }
}
