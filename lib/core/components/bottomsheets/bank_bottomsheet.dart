import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/custom_dropdown.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/core/model/user_model.dart';
import 'package:itcores_internship_project/features/setup/data/model/value_bank_model.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/bottom_sheet/bottomsheet_cubit.dart';

class BankBottomsheet extends StatelessWidget {
  final Function onChanged;
  final String value;
  final double height;
  final List<DropdownMenuItem<String>> items;
  final TextEditingController controller;
  final String pin;

  const BankBottomsheet(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.items,
      required this.controller,
      required this.height, this.pin= ''});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      AppAssets.chase,
      AppAssets.paypal,
      AppAssets.citi,
      AppAssets.bankOfAmerica,
      AppAssets.jago,
      AppAssets.mandiri,
      AppAssets.bca,
      AppAssets.chase,
      AppAssets.paypal,
      AppAssets.citi,
      AppAssets.bankOfAmerica,
      AppAssets.jago,
    ];

    return BottomSheet(
      enableDrag: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 2,
              ),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: Container(
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
                            validationType: AppStrings.name,
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.h, bottom: 20.0.h, left: 21.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppLocalizations.of(context)!.bank,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 150.h,
                        width: 344.w,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 1.5,
                          ),
                          itemCount: (context.read<BottomsheetCubit>().seeOther)
                              ? 12
                              : 8,
                          itemBuilder: (BuildContext context, int index) {
                            return BlocBuilder<BottomsheetCubit,
                                BottomsheetState>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<BottomsheetCubit>()
                                        .updateSelected(index);
                                  },
                                  child: Container(
                                    decoration: (context
                                                .read<BottomsheetCubit>()
                                                .index ==
                                            index)
                                        ? BoxDecoration(
                                            color: AppColors.purpleSecondary,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border.all(
                                                color: AppColors.purplePrimary))
                                        : (index == 7 &&
                                                context
                                                        .read<BottomsheetCubit>()
                                                        .seeOther ==
                                                    false)
                                            ? BoxDecoration(
                                                color: AppColors.purpleSecondary,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color: AppColors.white))
                                            : BoxDecoration(
                                                color: AppColors.unselectedGrid,
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                border: Border.all(
                                                    color: AppColors.white)),
                                    child: Center(
                                      child: (index == 7 &&
                                              context
                                                      .read<BottomsheetCubit>()
                                                      .seeOther ==
                                                  false)
                                          ? Text(AppLocalizations.of(context)!.seeOther,
                                              style: TextStyle(
                                                  color: AppColors.purplePrimary,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500))
                                          : Image.asset(images[index],
                                              height: 32.h, width: 32.w),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      10.verticalSpace,
                      CustomButton(
                          text: AppLocalizations.of(context)!.continueText,
                          onPressed: () async {
                            Box<UserModel> userBox = Hive.box<UserModel>(AppStrings.userHiveBox);
                            UserModel user = UserModel(pinNumber: pin,
                             accountNames: [context.read<BottomsheetCubit>().nameController.text], 
                             accountTypes: [ValueBankModel.valueBank[context.read<BottomsheetCubit>().value] ?? ''], 
                             accountAmounts: ["10000"]);
                            await userBox.put(AppStrings.userHiveBox, user);
                            if (context.mounted) {
                              context.goNamed(AppStrings.home);
                            }
                          },
                          size: Size(343.w, 56.h))
                    ],
                  ),
                ),
              )),
        );
      },
      onClosing: () {},
    );
  }
}
