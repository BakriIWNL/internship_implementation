part of 'signup_cubit.dart';

class SignupState {
  final GenericStates state;
  final bool isPasswordVisible;
  final bool isCheckboxChecked;
  const SignupState({
    required this.state,
    this.isPasswordVisible = false,
    this.isCheckboxChecked = false,
  });

  factory SignupState.initial() {
    return const SignupState(
      state: GenericStates.initial,
      isCheckboxChecked: false,
      isPasswordVisible: false,
    );
  }
  

  SignupState copyWith({
    GenericStates? state,
    bool? isPasswordVisible,
    bool? isCheckboxChecked,
  }) {
    return SignupState(
      state: state ?? this.state,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isCheckboxChecked: isCheckboxChecked ?? this.isCheckboxChecked,
    );
  }
}