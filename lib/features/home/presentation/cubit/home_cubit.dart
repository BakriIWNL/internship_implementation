import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void changeDateIndex(int index) {
    emit(state.copyWith(dateIndex: index));
  }

  void changeSelectedNavItem(int index){
    emit(state.copyWith(selectedNavItem: index));
  }
}
