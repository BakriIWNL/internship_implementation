import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/components/custom_dropdown.dart';
import 'package:itcores_internship_project/core/components/customtextfield.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/cubits/camera_cubit/camera_cubit.dart';
import 'package:itcores_internship_project/features/log/presentation/widgets/custom_icon_button.dart';

class LogBottomsheet extends StatelessWidget {
  final ValueChanged<String?> categoryOnChanged;
  final ValueChanged<String?> walletOnChanged;
  final String categoryValue;
  final String walletValue;
  final Function onPressed;
  final List<DropdownMenuItem<String>> items;
  final TextEditingController controller;
  final String text;

  const LogBottomsheet(
      {super.key,
      required this.text,
      required this.categoryOnChanged,
      required this.walletOnChanged,
      required this.categoryValue,
      required this.walletValue,
      required this.items,
      required this.controller,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) => CameraCubit(),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
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
                            value: categoryValue,
                            items: items,
                            hint: AppLocalizations.of(context)!.category,
                            width: 343.w,
                            height: 56.h,
                            onChanged: categoryOnChanged),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        width: 343.w,
                        child: NewCustomTextField(
                            hint: AppLocalizations.of(context)!.description,
                            controller: controller,
                            validationType: AppStrings.name,
                            height: 56.h,
                            password: false,
                            width: 343.w),
                      ),
                      20.verticalSpace,
                      CustomDropdown(
                          items: items,
                          value: walletValue,
                          hint: AppLocalizations.of(context)!.wallet,
                          width: 343.w,
                          height: 56.h,
                          onChanged: walletOnChanged),
                      20.verticalSpace,
                      BlocBuilder<CameraCubit, CameraState>(builder: (context, state) {
                        return (context.read<CameraCubit>().state.image == null)
                            ? CustomIconButton(
                                icon: Icons.attachment,  
                                text: text,
                                onPressed: () {
                                  context.read<CameraCubit>().addImage();
                                },
                                size: Size(343.w, 56.h),
                                backgroundColor: AppColors.white,
                                textColor: AppColors.greyText,
                              )
                            : SizedBox(
                                height: 118.h,
                                width: 117.w,
                                child: Stack(
                                  children: [
                                    Container(
                                        width: 112.w,
                                        height: 112.h,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Image.file(
                                          context
                                              .read<CameraCubit>()
                                              .state
                                              .image!,
                                          fit: BoxFit.cover,
                                        )),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          context
                                              .read<CameraCubit>()
                                              .removeImage();
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                      }),
                      const Spacer(),
                      CustomButton(
                          text: AppLocalizations.of(context)!.continueText,
                          onPressed: onPressed,
                          size: Size(343.w, 56.h)),
                      20.verticalSpace,
                    ],
                  ),
                )),
          ),
        );
      },
      onClosing: () {},
    );
  }
}
