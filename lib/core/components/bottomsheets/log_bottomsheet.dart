import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/custom_dropdown.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/features/log/presentation/widgets/custom_icon_button.dart';

class LogBottomsheet extends StatelessWidget {
  final Function onChanged;
  final String value;
  final Function onPressed;
  final List<DropdownMenuItem<String>> items;
  final TextEditingController controller;
  final String text;

  const LogBottomsheet(
      {super.key,
      required this.text,
      required this.onChanged,
      required this.value,
      required this.items,
      required this.controller,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom / 2,
            ),
            child: Container(
              height: 483.h,
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
                    child: CustomDropdown(
                        items: items,
                        hint: "Category",
                        width: 343.w,
                        height: 56.h,
                        onChanged: (value) {}),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: 343.w,
                    child: NewCustomTextField(
                        hint: "Description",
                        controller: controller,
                        validationType: AppLocalizations.of(context)!.name,
                        height: 56.h,
                        password: false,
                        width: 343.w),
                  ),
                  20.verticalSpace,
                  CustomDropdown(
                      items: items,
                      hint: "Wallet",
                      width: 343.w,
                      height: 56.h,
                      onChanged: (value) {}),
                  20.verticalSpace,
                  CustomIconButton(
                    icon: Icons.attachment,
                    text: text,
                    onPressed: () {},
                    size: Size(343.w, 56.h),
                    backgroundColor: AppColors.white,
                    textColor: AppColors.greyText,
                  ),
                  const Spacer(),
                  CustomButton(
                      text: AppLocalizations.of(context)!.continueText,
                      onPressed: onPressed,
                      size: Size(343.w, 56.h)),
                  20.verticalSpace,
                ],
              ),
            ));
      },
      onClosing: () {},
    );
  }
}
