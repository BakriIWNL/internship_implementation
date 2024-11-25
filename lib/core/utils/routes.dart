import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/onboardingscreen.dart';
import 'package:itcores_internship_project/features/onboarding/presentation/screens/splashscreen.dart';

class Routes {
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
          path: '/onboarding',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const OnboardingScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          }),
    ],
  );
}
