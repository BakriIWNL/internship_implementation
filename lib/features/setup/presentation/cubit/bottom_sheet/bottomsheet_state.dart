part of 'bottomsheet_cubit.dart';

class BottomsheetState extends Equatable {
  final BottomSheetStates state;
  final double height;
  final int oldHeight;
  const BottomsheetState({required this.state,required this.height, required this.oldHeight});

  factory BottomsheetState.initial() {
    return const BottomsheetState(
      state: BottomSheetStates.initial, height: 254,oldHeight:254
    );
  }

  BottomsheetState copyWith({
    BottomSheetStates? state,
    double ? height
  }) {
    return BottomsheetState(
      state: state ?? this.state, height: height ?? this.height, oldHeight: oldHeight
    );
  }

  @override
  List<Object> get props => [state,height,oldHeight];
}