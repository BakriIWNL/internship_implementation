import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String hint;
  final double width;
  final double height;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.hint,
    required this.width,
    required this.height,
    this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down_sharp),
          value: value,
          hint: Text(
            hint,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.greyText),
          ),
          items: items,
          onChanged: onChanged,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: AppColors.greyText),
          dropdownColor: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}