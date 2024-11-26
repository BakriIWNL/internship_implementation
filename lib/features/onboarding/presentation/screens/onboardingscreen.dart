import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/widgets/carouselindicator.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/widgets/carouselslider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CarouselCubit, CarouselState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                Carousel(),
                const CarouselIndicator(),
                // 33.verticalSpace,
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    fixedSize: (Size(MediaQuery.of(context).size.width * 0.915, 56.h)),
                    backgroundColor: AppColors.purplePrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                        color: AppColors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                16.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: (Size(MediaQuery.of(context).size.width * 0.915, 56.h)),
                    backgroundColor: AppColors.purpleSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Log in",
                    style: GoogleFonts.inter(
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
