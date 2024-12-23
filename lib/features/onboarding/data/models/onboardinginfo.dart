import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingInfo {
  final String title;
  final String subTitle;
  final String imagePath;

  OnBoardingInfo({required this.title, required this.subTitle, required this.imagePath});

  static List<OnBoardingInfo> getOnBoardingInfoList(BuildContext context) {
    return [
      OnBoardingInfo(
        title: context.Localizations.gainTotal,
        subTitle: context.Localizations.gainTotalSub,
        imagePath: AppAssets.gaincontrol,
      ),
      OnBoardingInfo(
        title: context.Localizations.knowWhere,
        subTitle: context.Localizations.knowWhereSub,
        imagePath: AppAssets.knowwhere,
      ),
      OnBoardingInfo(
        title: context.Localizations.planningAhead,
        subTitle: context.Localizations.planningAheadSub,
        imagePath: AppAssets.planningahead,
      ),
    ];
  }
}

// Create a context extension for easier access to AppLocalizations
extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get Localizations => AppLocalizations.of(this)!;
}