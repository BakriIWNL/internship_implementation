import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/custom_dropdown.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultBottomsheet extends StatelessWidget {
  DefaultBottomsheet({super.key});

  TextEditingController temp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropDownItems = [
      const DropdownMenuItem(value: '0', child: Text("Bank")),
      const DropdownMenuItem(value: '1', child: Text("Debit Card")),
      const DropdownMenuItem(value: '2', child: Text("Credit Card"))
    ];
    return Container(
      height: 254.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r), color: AppColors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          25.verticalSpace,
          SizedBox(
            width: 343.w,
            child: NewCustomTextField(
                hint: AppLocalizations.of(context)!.name,
                controller: temp,
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
            items: dropDownItems,
            onChanged: (String? value) {},
          ),
          20.verticalSpace,
          CustomButton(text: AppLocalizations.of(context)!.continueText, onPressed: (){}, size: Size(343.w,56.h))
        ],
      ),
    );
  }
}
