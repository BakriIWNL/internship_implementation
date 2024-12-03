part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable{
  SplashScreenState({
    required this.state,
  });
  final SplashStates state;

  factory SplashScreenState.active() {
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
  
  @override
  List<Object?> get props => [state];
}
