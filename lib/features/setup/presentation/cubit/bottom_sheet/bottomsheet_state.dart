part of 'bottomsheet_cubit.dart';

class BottomsheetState extends Equatable {
  final BottomSheetStates state;
  final double height;
  final int? index;
  const BottomsheetState({required this.state,required this.height, this.index});

  factory BottomsheetState.initial() {
    return const BottomsheetState(
      state: BottomSheetStates.initial, height: 254,index:null
    );
  }

  BottomsheetState copyWith({
    BottomSheetStates? state,
    double ? height, int? index
  }) {
    return BottomsheetState(
      state: state ?? this.state, height: height ?? this.height, index:index ?? this.index
    );
  }

  @override
  List<Object?> get props => [state, height, index];
}