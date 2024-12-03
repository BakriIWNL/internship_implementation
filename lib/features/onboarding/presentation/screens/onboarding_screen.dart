import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/custom_button.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
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
                CustomButton(
                    text: AppStrings.signUp,
                    onPressed: () => context.go(RouteNames.signUp),
                    size: Size(343.w, 56.h)),
                16.verticalSpace,
                CustomButton(
                  text: AppStrings.logIn,
                  onPressed: () => context.go(RouteNames.login),
                  size: Size(343.w, 56.h),
                  textColor: AppColors.purplePrimary,
                  backgroundColor: AppColors.purpleSecondary,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
