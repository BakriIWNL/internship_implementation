import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';

class ItemDataModel {
  final String reason;
  final Color mainColor;
  final Color secondaryColor;
  final String icon;
  final bool expense; // true for expense, false for income

  ItemDataModel({
    required this.reason,
    required this.mainColor,
    required this.secondaryColor,
    required this.icon,
    required this.expense,
  });

  static Map<String, ItemDataModel> getItemMap() {
    return {
      AppStrings.shopping: ItemDataModel(
        reason: AppStrings.shopping,
        mainColor: AppColors.yellowPrimary,
        secondaryColor: AppColors.yellowSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      AppStrings.subscription: ItemDataModel(
        reason: AppStrings.subscription,
        icon: AppAssets.gaincontrol,
        expense: true,
        mainColor: AppColors.purplePrimary,
        secondaryColor: AppColors.purpleSecondary,
      ),
      AppStrings.food: ItemDataModel(
        reason: AppStrings.food,
        mainColor: AppColors.redPrimary,
        secondaryColor: AppColors.redSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      AppStrings.transport: ItemDataModel(
        reason: AppStrings.transport,
        mainColor: AppColors.bluePrimary,
        secondaryColor: AppColors.blueSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      AppStrings.salary: ItemDataModel(
        reason: AppStrings.salary,
        mainColor: AppColors.greenPrimary,
        secondaryColor: AppColors.greenSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
      AppStrings.passiveIncome: ItemDataModel(
        reason: AppStrings.passiveIncome,
        mainColor: AppColors.blackPrimary,
        secondaryColor: AppColors.blackSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
    };
  }
}