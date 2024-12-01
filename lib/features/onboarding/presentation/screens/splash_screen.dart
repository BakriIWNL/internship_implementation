import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/splash_screen/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenCubit>().splashScreenCycle();
    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        if (state.state == SplashStates.concluded) {
          context.go(RouteNames.onboarding);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: Stack(children: [
          Positioned(
              top: 374.h,
              left: 123.w,
              child: Container(
                height: 74.h,
                width: 74.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.blur,
                      spreadRadius: 20,
                      blurRadius: 30,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              )),
          Center(
            child: Text(AppStrings.appName,
                style: TextStyle(
                  fontSize: 56.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                )),
          ),
        ]),
      ),
    );
  }
}
