import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      context.go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Text(
            'montra',
            style: GoogleFonts.inter(
              fontSize: 56.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
