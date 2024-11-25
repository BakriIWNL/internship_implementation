import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/utils/carousellist.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/widgets/slidercontent.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SliderContent(imagePath: CarouselList.carouselList[0].values.first.values.first, heading: heading, subHeading: subHeading),
      ),
    );
  }
}