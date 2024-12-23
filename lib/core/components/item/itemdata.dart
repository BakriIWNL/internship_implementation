import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemData {
  final String reason;
  final Color mainColor;
  final Color secondaryColor;
  final String icon;
  final bool expense; // true for expense, false for income

  ItemData({
    required this.reason,
    required this.mainColor,
    required this.secondaryColor,
    required this.icon,
    required this.expense,
  });

  static Map<String, ItemData> getItemMap(BuildContext context) {
    return {
      context.loc.shopping: ItemData(
        reason: AppLocalizations.of(context)!.shopping,
        mainColor: AppColors.yellowPrimary,
        secondaryColor: AppColors.yellowSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      context.loc.subscription: ItemData(
        reason: AppLocalizations.of(context)!.subscription,
        icon: AppAssets.gaincontrol,
        expense: true,
        mainColor: AppColors.purplePrimary,
        secondaryColor: AppColors.purpleSecondary,
      ),
      context.loc.food: ItemData(
        reason: AppLocalizations.of(context)!.food,
        mainColor: AppColors.redPrimary,
        secondaryColor: AppColors.redSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      context.loc.transport: ItemData(
        reason: context.loc.transport,
        mainColor: AppColors.bluePrimary,
        secondaryColor: AppColors.blueSecondary,
        icon: AppAssets.gaincontrol,
        expense: true,
      ),
      context.loc.salary: ItemData(
        reason: context.loc.salary,
        mainColor: AppColors.greenPrimary,
        secondaryColor: AppColors.greenSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
      context.loc.passiveIncome: ItemData(
        reason: context.loc.passiveIncome,
        mainColor: AppColors.blackPrimary,
        secondaryColor: AppColors.blackSecondary,
        icon: AppAssets.gaincontrol,
        expense: false,
      ),
    };
  }
}

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}