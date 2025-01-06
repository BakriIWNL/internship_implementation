part of 'item_cubit.dart';

class ItemState extends Equatable {
  final GenericStates state;
  final List<ItemModel> items;

  const ItemState({required this.state, this.items = const []});

  factory ItemState.initial() {
    return const ItemState(state: GenericStates.initial, items: []);
  }

  ItemState copyWith({
    GenericStates? state,
    List<ItemModel>? items,
  }) {
    return ItemState(
      state: state ?? this.state,
      items: items ?? this.items,
    );
  }

  @override
  List<Object> get props => [state, items];
}