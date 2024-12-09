import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(SetupState.initial());

  TextEditingController pinController = TextEditingController();


  @override
  Future<void> close() {
    pinController.dispose();
    return super.close();
  }

  void addPin(int number) {
    if (!checkComplete(pinController.text.length)) {
      pinController.text += number.toString();
      emit(state.copyWith(states: GenericStates.updateUI));
      emit(state.copyWith(states: GenericStates.initial));
    }
  }

  void removedPin() {
    if (pinController.text.isNotEmpty) {
      pinController.text =
          pinController.text.substring(0, pinController.text.length - 1);
      emit(state.copyWith(states: GenericStates.updateUI));
      emit(state.copyWith(states: GenericStates.initial));
    }
  }

  bool checkComplete(int length) {
    if (length == 4) {
      return true;
    }
    return false;
  }

  // bool checkFull(int){

  // }
}
