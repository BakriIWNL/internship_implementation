part of 'home_cubit.dart';

class HomeState extends Equatable {
  final GenericStates state ;
  final int dateIndex;
  final int selectedNavItem;
  const HomeState({this.state = GenericStates.initial, this.dateIndex = 0, this.selectedNavItem = 0});

  factory HomeState.initial() {
    return const HomeState(
      state: GenericStates.initial,
      dateIndex: 0,
      selectedNavItem: 0,
    );
  }

  HomeState copyWith({
    GenericStates? state,
    int? dateIndex,
    int? selectedNavItem,
  }) {
    return HomeState(
      state: state ?? this.state,
      dateIndex: dateIndex ?? this.dateIndex,
      selectedNavItem: selectedNavItem ?? this.selectedNavItem,
    );
  }

  @override
  List<Object> get props => [dateIndex, selectedNavItem];
}
