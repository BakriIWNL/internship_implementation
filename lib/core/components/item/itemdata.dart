import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class ItemData {
  final String reason;
  final Color mainColor;
  final Color secondaryColor;
  final String icon;
  final bool expense; // true for expense, false for income

  ItemData(
      {this.reason = "Shopping",
      this.mainColor = AppColors.yellowPrimary,
      this.secondaryColor = AppColors.yellowSecondary,
      this.icon = AppAssets.gaincontrol,
      this.expense = true});

  static Map<String, ItemData> getItemMap() {
    return {
      "Shopping": ItemData(
        reason: "Shopping",
        mainColor: AppColors.yellowPrimary,
        secondaryColor: AppColors.yellowSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      "Subscription": ItemData(
        reason: "Subscription",
        icon: AppAssets.gaincontrol,
        expense: true,
        mainColor: AppColors.purplePrimary,
        secondaryColor: AppColors.purpleSecondary,
      ),
      "Food": ItemData(
        reason: "Food",
        mainColor: AppColors.redPrimary,
        secondaryColor: AppColors.redSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      "Transportation": ItemData(
        reason: "Transportation",
        mainColor: AppColors.bluePrimary,
        secondaryColor: AppColors.blueSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      "Salary": ItemData(
        reason: "Salary",
        mainColor: AppColors.greenPrimary,
        secondaryColor: AppColors.greenSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
      "Passive Income": ItemData(
        reason: "Passive Income",
        mainColor: AppColors.blackPrimary,
        secondaryColor: AppColors.blackSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
    };
  }
}
