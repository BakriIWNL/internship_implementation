import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/features/login/presentation/screens/loginscreen.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/cubit/carousel/carousel_cubit.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/onboardingscreen.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/splashscreen.dart';
import 'package:itcores_internship_project/features/signup/presentation/screens/signupscreen.dart';

class Routes {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: '/onboarding',
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
      GoRoute(path: '/login', builder: (context, state) => const LogInScreen()),
      GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
    ],
  );
}
