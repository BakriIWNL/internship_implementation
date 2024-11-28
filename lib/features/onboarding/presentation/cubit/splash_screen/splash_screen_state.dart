part of 'splash_screen_cubit.dart';

class SplashScreenState {
  SplashScreenState({
    required this.state,
  });
  final SplashStates state;

  static SplashScreenState active() {
    return SplashScreenState(
      state: SplashStates.active,
    );
  }

  SplashScreenState copyWith({
    SplashStates? state,
  }) {
    return SplashScreenState(
      state: state ?? this.state,
    );
  }
}
