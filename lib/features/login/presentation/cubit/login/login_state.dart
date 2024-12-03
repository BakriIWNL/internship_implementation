part of 'login_cubit.dart';

class LoginState extends Equatable{
  final GenericStates state;
  final bool isPasswordVisible;

  const LoginState({
    required this.state,
    this.isPasswordVisible = false,
  });

  factory LoginState.initial() {
    return const LoginState(
      state: GenericStates.initial,
      isPasswordVisible: false,
    );
  }

  LoginState copyWith({
    GenericStates? state,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      state: state ?? this.state,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [state, isPasswordVisible];
}