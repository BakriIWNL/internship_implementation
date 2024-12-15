import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79.h,
      width: double.infinity,
      child: BottomAppBar(
        color: AppColors.bottomNavBar,
        elevation: 0.0,
        child: Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.bottomNavBar,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Row(
            children: [
              navItem(
                Icons.home,
                pageIndex == 0,
                "Home",
                onTap: () => onTap(0),
              ),
              navItem(
                Icons.arrow_back,
                pageIndex == 1,
                "Transaction",
                onTap: () => onTap(1),
              ),
              const SizedBox(width: 80),
              navItem(
                Icons.pie_chart,
                pageIndex == 2,
                "Budget",
                onTap: () => onTap(2),
              ),
              navItem(
                Icons.person,
                pageIndex == 3,
                "Profile",
                onTap: () => onTap(3),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, String text,
      {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? AppColors.purplePrimary : AppColors.unselected,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: selected
                      ? AppColors.purplePrimary
                      : AppColors.unselected),
            )
          ],
        ),
      ),
    );
  }
}
