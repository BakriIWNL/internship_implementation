import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderContent extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String subHeading;

  const SliderContent({
    super.key,
    required this.imagePath,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 312.w,
          height: 312.h,
        ),
        41.verticalSpace,
        Text(heading,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
            )),
        17.verticalSpace,
        Text(subHeading,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
