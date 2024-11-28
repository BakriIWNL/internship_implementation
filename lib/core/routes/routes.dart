import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/features/login/presentation/screens/login_screen.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:itcores_internship_project/features/signup/presentation/screens/signup_screen.dart';

class Routes {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(
          path: RouteNames.splash,
          builder: (context, state) => BlocProvider(
                create: (context) => SplashScreenCubit(),
                child: const SplashScreen(),
              )),
      GoRoute(
        path: RouteNames.onboarding,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => CarouselCubit(),
            child: const OnboardingScreen(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
          path: RouteNames.login,
          builder: (context, state) => const LogInScreen()),
      GoRoute(
          path: RouteNames.signUp,
          builder: (context, state) => const SignUpScreen()),
    ],
  );
}