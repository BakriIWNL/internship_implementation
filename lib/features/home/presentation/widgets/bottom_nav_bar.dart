import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.r),
        topRight: Radius.circular(10.r),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomAppBar(
            color: AppColors.bottomNavBar,
            shape: const CircularNotchedRectangle(),
            elevation: 0.0,
            height: 69.h,
            child: Row(
              children: [
                navItem(
                  Icons.home,
                  context.read<HomeCubit>().state.selectedNavItem == 0,
                  AppLocalizations.of(context)!.home,
                  onTap: () {
                    context.read<HomeCubit>().changeSelectedNavItem(0);
                  },
                ),
                navItem(
                  Icons.arrow_back,
                  context.read<HomeCubit>().state.selectedNavItem == 1,
                  AppLocalizations.of(context)!.transactions,
                  onTap: () {
                    context.read<HomeCubit>().changeSelectedNavItem(1);
                  },
                ),
                SizedBox(width: 80.w),
                navItem(
                  Icons.pie_chart,
                  context.read<HomeCubit>().state.selectedNavItem == 2,
                  AppLocalizations.of(context)!.budget,
                  onTap: () {
                    context.read<HomeCubit>().changeSelectedNavItem(2);
                  },
                ),
                navItem(
                  Icons.person,
                  context.read<HomeCubit>().state.selectedNavItem == 3,
                  AppLocalizations.of(context)!.profile,
                  onTap: () {
                    context.read<HomeCubit>().changeSelectedNavItem(3);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, String text,
      {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        enableFeedback: false,
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
