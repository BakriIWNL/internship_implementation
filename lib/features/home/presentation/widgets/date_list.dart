import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateList extends StatelessWidget {
  DateList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      AppLocalizations.of(context)!.today,
      AppLocalizations.of(context)!.week,
      AppLocalizations.of(context)!.month,
      AppLocalizations.of(context)!.year
    ];
    return SizedBox(
      height: 34.h,
      width: 346.w,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 34.h,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<HomeCubit>().changeDateIndex(index);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 23.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: state.dateIndex == index
                                ? AppColors.yellowSecondary
                                : Colors.transparent,
                          ),
                          child: Text(
                            _items[index],
                            style: TextStyle(
                              color: state.dateIndex == index
                                  ? AppColors.yellowPrimary
                                  : AppColors.greyText,
                              fontWeight: state.dateIndex == index
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
