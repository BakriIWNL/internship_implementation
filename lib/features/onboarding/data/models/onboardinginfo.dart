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
        title: AppLocalizations.of(context)!.gainTotal,
        subTitle: AppLocalizations.of(context)!.gainTotalSub,
        imagePath: AppAssets.gaincontrol
      ),
      OnBoardingInfo(
        title: AppLocalizations.of(context)!.knowWhere,
        subTitle: AppLocalizations.of(context)!.knowWhereSub,
        imagePath: AppAssets.knowwhere
      ),
      OnBoardingInfo(
        title: AppLocalizations.of(context)!.planningAhead,
        subTitle: AppLocalizations.of(context)!.planningAheadSub,
        imagePath: AppAssets.planningahead
      ),
    ];
  }
}