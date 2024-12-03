part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable{
  const SplashScreenState({
    required this.state,
  });
  final SplashStates state;

  factory SplashScreenState.active() {
    return const SplashScreenState(
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
  
  @override
  List<Object?> get props => [state];
}
