import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/features/home/data/model/user_model.dart';

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
