part of 'setup_cubit.dart';

class SetupState extends Equatable {
  final GenericStates states;

  const SetupState({required this.states});

  factory SetupState.initial() {
    return const SetupState(
      states: GenericStates.initial
    );
  }

  SetupState copyWith({
    GenericStates? states
  }) {
    return SetupState(
      states: states ?? this.states
    );
  }

  @override
  List<Object> get props => [states];
}