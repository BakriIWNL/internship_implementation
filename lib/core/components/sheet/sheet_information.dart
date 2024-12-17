import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/sheet/sheet_data.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class SheetInformation extends StatelessWidget {
  const SheetInformation({super.key, required this.space, required this.type,required this.textColor});
  final int space;
  final String type;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            space.verticalSpace,
            Text(
              SheetData().getSheetData()[type]!.header,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            10.verticalSpace,
            Text(
              "\$00.0",
              style: TextStyle(
                fontSize: 64.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
