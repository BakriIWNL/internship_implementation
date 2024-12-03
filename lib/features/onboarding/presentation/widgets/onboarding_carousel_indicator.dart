import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/features/onboarding/data/models/onboardinginfo.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';

class OnboardingCarouselIndicator extends StatelessWidget {
  const OnboardingCarouselIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              OnBoardingInfo.getOnBoardingInfoList(context).length,
              (index) {
                return GestureDetector(
                  onTap: () => context.read<CarouselCubit>().onPageChanged(
                        currentPage: index,
                      ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: state.currentPage == index ? 16 : 8,
                    height: state.currentPage == index ? 16 : 8,
                    margin: EdgeInsets.only(right: 24.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: state.currentPage == index
                          ? AppColors.purplePrimary
                          : AppColors.purpleSecondary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
