import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/expandable_fab/expandable_fab.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/dates.dart';
import 'package:itcores_internship_project/features/home/presentation/widgets/bottomnavbar.dart';
import 'package:itcores_internship_project/core/components/expandable_fab/custom_expandable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(color: AppColors.purplePrimary, width: 2.w),
              ),
              child: AppIcons.profile,
            ),
            Container(
              width: 107.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColors.purplePrimary,
                  ),
                  Text(
                    Dates.months[DateTime.now().month - 1],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.notifications_none,
              color: AppColors.purplePrimary,
              size: 32.sp,
            ),
          ],
        ),
      
      ),
      floatingActionButton: const CustomExpandableFab(),
      floatingActionButtonLocation: ExpandableFab.location,
      bottomNavigationBar: NavBar(pageIndex: 0, onTap: (index){})
    );
  }
}
