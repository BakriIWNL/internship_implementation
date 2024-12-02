part of 'signup_cubit.dart';

class SignupState {
  final GenericStates state;

  const SignupState({
    required this.state,
  });

  factory SignupState.initial() {
    return const SignupState(
      state: GenericStates.initial,
    );
  }
  
  SignupState copyWith({
    GenericStates? state,
  }) {
    return SignupState(
      state: state ?? this.state,
    );
  }
}