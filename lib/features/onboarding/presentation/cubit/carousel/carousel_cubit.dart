import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselState.initial());

  final PageController pageController = PageController();

  void onPageChanged({
    required int currentPage,
  }) {
    // pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    pageController.jumpToPage(currentPage);
    emit(
      state.copyWith(
        currentPage: currentPage,
        state: GenericStates.updateUI,
      ),
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}