part of 'setup_cubit.dart';

class SetupState extends Equatable {
  final String pin;

  const SetupState({required this.pin});

  factory SetupState.initial() {
    return const SetupState(
      pin: ''
    );
  }

  SetupState copyWith({
    String? pin
  }) {
    return SetupState(
      pin: pin ?? this.pin
    );
  }

  @override
  List<Object> get props => [pin];
}