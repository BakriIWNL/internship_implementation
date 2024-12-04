import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/setup/setup_cubit.dart';
import 'package:itcores_internship_project/features/setup/presentation/widgets/pin_dots.dart';
import 'package:itcores_internship_project/features/setup/presentation/widgets/pin_numpad.dart';

class EnterPinScreen extends StatelessWidget {
  const EnterPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purplePrimary,
      body: Padding(
        padding: EdgeInsets.only(top: 90.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.setupPin,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600),
            ),
            92.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 85.w),
              child: BlocBuilder<SetupCubit, SetupState>(
                builder: (context, state) {
                  return const PinDots();
                },
              ),
            ),
            216.verticalSpace,
            const PinNumpad(),
          ],
        ),
      ),
    );
  }
}
