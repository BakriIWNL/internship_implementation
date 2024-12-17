import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/custom_fab.dart';
import 'package:itcores_internship_project/core/themes/app_assets.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/bottomnavbar.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/date_list.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/home_appbar.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/list_data.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/number_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: ExpandableFab.location,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 285.h,
              width: 375.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  gradient: const LinearGradient(
                      colors: [Color(0xFFFFF6E5), Color(0XFFF8EDD8)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppbar(),
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.accountBalance,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: AppColors.greyText),
                  ),
                ),
                10.verticalSpace,
                Center(
                  child: Text(
                    "\$9400",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.sp,
                        color: AppColors.blackText),
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberCard(
                        color: AppColors.greenPrimary,
                        number: 5000,
                        type: AppLocalizations.of(context)!.income),
                    10.horizontalSpace,
                    NumberCard(
                        color: AppColors.redPrimary,
                        number: 1200,
                        type: AppLocalizations.of(context)!.expenses),
                  ],
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    AppLocalizations.of(context)!.spendFrequency,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.blackText),
                  ),
                ),
                Image.asset(
                  AppAssets.graph,
                  fit: BoxFit.fill,
                  height: 170.h,
                  width: 375.w,
                ),
                Center(child: DateList()),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.recentTransactions,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    40.horizontalSpace,
                    Container(
                      width: 78.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: AppColors.purpleSecondary,
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Center(
                        child: Text(AppLocalizations.of(context)!.seeAll,
                            style: TextStyle(
                                color: AppColors.purplePrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Center(child: ListData()),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: NavBar(),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: CustomExpandableFab(),
          )
        ],
      ),
    );
  }
}
