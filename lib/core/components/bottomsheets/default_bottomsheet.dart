import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/custom_dropdown.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultBottomSheet extends StatelessWidget {
  
  final Function onChanged;
  final String value;
  final double height;
  final List<DropdownMenuItem<String>> items;
  final  TextEditingController controller;

  const DefaultBottomSheet({super.key, required this.onChanged,required this.value,required this.items, required this.controller, required this.height});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom/2,
          ),
          child: AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child:Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: AppColors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                25.verticalSpace,
                SizedBox(
                  width: 343.w,
                  child: NewCustomTextField(
                      hint: AppLocalizations.of(context)!.name,
                      controller: controller,
                      validationType: AppLocalizations.of(context)!.name,
                      height: 56.h,
                      password: false,
                      width: 343.w),
                ),
                20.verticalSpace,
                CustomDropdown(
                  hint: AppLocalizations.of(context)!.accountType,
                  width: 343.w,
                  height: 50.h,
                  items: items,
                  onChanged: (String? value) {
                    onChanged(value);
                  },
                  value: value,
                ),
                20.verticalSpace,
                CustomButton(
                    text: AppLocalizations.of(context)!.continueText,
                    onPressed: () {},
                    size: Size(343.w, 56.h))
              ],
            ),
          ),
              )
          
        );
      },
      onClosing: () {},
    );
  }
}
