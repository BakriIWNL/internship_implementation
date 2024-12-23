part of 'item_cubit.dart';

class ItemState extends Equatable {
  final GenericStates state;
  const ItemState({required this.state});

  factory ItemState.initial(){
    return const ItemState(state: GenericStates.initial);
  }

  ItemState copyWith({
    GenericStates? state
  }){
    return ItemState(state: state ?? this.state);
  }

  @override
  List<Object> get props => [state];
}
