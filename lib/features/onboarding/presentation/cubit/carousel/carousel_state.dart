part of 'carousel_cubit.dart';


class CarouselState extends Equatable{
  const CarouselState({
    required this.currentPage,
    required this.state,
  });

  final int currentPage;
  final GenericStates state;

  factory CarouselState.initial() {
    return const CarouselState(
      currentPage: 0,
      state: GenericStates.initial,
    );
  }

  CarouselState copyWith({
    int? currentPage,
    GenericStates? state,
  }) {
    return CarouselState(
      currentPage: currentPage ?? this.currentPage,
      state: state ?? this.state,
    );
  }
  
  @override
  List<Object?> get props => [currentPage, state];
}
