import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:itcores_internship_project/core/components/item/itemdata.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class CustomItem extends StatelessWidget {
  
  final String reason;
  final int amount;
  final DateTime dateTime;
  final String description;

  const CustomItem({super.key,required this.reason, required this.amount, required this.dateTime,required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        height: 89.h,
        width: 336.w,
        decoration: BoxDecoration(
          color: AppColors.bottomNavBar,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: ItemData.getItemMap()[reason]?.secondaryColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Center(
                  child: Image.asset(
                    ItemData.getItemMap()[reason]!.icon,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reason,
                  style: TextStyle(
                    color: AppColors.blackText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ItemData.getItemMap()[reason]!.expense ? " - \$${amount.toString()}" : " + \$${amount.toString()}",
                  style: TextStyle(
                    color: ItemData.getItemMap()[reason]!.expense ? AppColors.redPrimary : AppColors.greenPrimary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  DateFormat('hh:mm a').format(dateTime),
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10.w,)
          ],
        ),
      ),
    );
  }
}