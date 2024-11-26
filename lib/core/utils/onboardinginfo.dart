import 'package:itcores_internship_project/core/utils/app_assets.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';

class OnBoardingInfo {
  final String title;
  final String subTitle;
  final String imagePath;

  OnBoardingInfo({required this.title, required this.subTitle, required this.imagePath});

  static List<OnBoardingInfo> onBoardingInfoList = [
    OnBoardingInfo(
      title: AppStrings.gainTotal,
      subTitle: AppStrings.gainTotalSub,
      imagePath: AppAssets.gaincontrol
    ),
    OnBoardingInfo(
      title: AppStrings.knowWhere,
      subTitle: AppStrings.knowWhereSub,
      imagePath: AppAssets.knowwhere
    ),
    OnBoardingInfo(
      title: AppStrings.planningAhead,
      subTitle: AppStrings.planningAheadSub,
      imagePath: AppAssets.planningahead
    ),
  ];
}