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
        title: context.localizations.gainTotal,
        subTitle: context.localizations.gainTotalSub,
        imagePath: AppAssets.gaincontrol
      ),
      OnBoardingInfo(
        title: context.localizations.knowWhere,
        subTitle: context.localizations.knowWhereSub,
        imagePath: AppAssets.knowwhere
      ),
      OnBoardingInfo(
        title: context.localizations.planningAhead,
        subTitle: context.localizations.planningAheadSub,
        imagePath: AppAssets.planningahead
      ),
    ];
  }
}