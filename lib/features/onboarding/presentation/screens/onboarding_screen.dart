import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/widgets/onboarding_carousel_indicator.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/widgets/onboarding_carousel_slider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarouselCubit, CarouselState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                const OnboardingCarousel(),
                const OnboardingCarouselIndicator(),
                // 33.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        (Size(MediaQuery.of(context).size.width * 0.915, 56.h)),
                    backgroundColor: AppColors.purplePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: Text(AppStrings.signUp,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600)),
                ),
                16.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        (Size(MediaQuery.of(context).size.width * 0.915, 56.h)),
                    backgroundColor: AppColors.purpleSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    context.go('/signup');
                  },
                  child: Text(
                    AppStrings.logIn,
                    style: TextStyle(
                        color: AppColors.purplePrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
