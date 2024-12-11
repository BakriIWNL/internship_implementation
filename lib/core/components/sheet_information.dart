import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/bottom_sheet/bottomsheet_cubit.dart';

class SheetInformation extends StatelessWidget {
  const SheetInformation({super.key, required this.space});
  final int space;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: BlocBuilder<BottomsheetCubit, BottomsheetState>(
          builder: (context, state) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space.verticalSpace,
                  Text(
                    context.localizations.balance,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.purpleTertiary,
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    "\$00.0",
                    style: TextStyle(
                      fontSize: 64.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
