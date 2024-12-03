part of 'forgotpassword_cubit.dart';

class ForgotpasswordState extends Equatable{
  final GenericStates state;
  const ForgotpasswordState({
    required this.state,
  });

  factory ForgotpasswordState.initial() {
    return const ForgotpasswordState(
      state: GenericStates.initial,
    );
  }

  ForgotpasswordState copyWith({
    GenericStates? state,
  }) {
    return ForgotpasswordState(
      state: state ?? this.state,
    );
  }
  
  @override
  List<Object?> get props => [state];
}
