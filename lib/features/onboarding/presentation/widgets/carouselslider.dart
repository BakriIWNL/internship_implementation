import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/core/utils/onboardinginfo.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';

class Carousel extends StatefulWidget {
  Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: PageView(
            controller: context.read<CarouselCubit>().pageController,        
            onPageChanged: (value) =>
                context.read<CarouselCubit>().onPageChanged(
                      currentPage: value,
                    ),
            children: List.generate(
              OnBoardingInfo.onBoardingInfoList.length,
              (index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 312.w,
                      height: 312.h,
                      OnBoardingInfo
                          .onBoardingInfoList[state.currentPage].imagePath,
                    ),
                    Text(
                      OnBoardingInfo
                          .onBoardingInfoList[state.currentPage].title,
                      style: GoogleFonts.inter(
                          color: AppColors.blackText,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    17.verticalSpace,
                    Text(
                      OnBoardingInfo
                          .onBoardingInfoList[state.currentPage].subTitle,
                      style: GoogleFonts.inter(
                        color: AppColors.greyText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
