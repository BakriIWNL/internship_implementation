
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'bottomsheet_state.dart';

class BottomsheetCubit extends Cubit<BottomsheetState> {
  BottomsheetCubit() : super(BottomsheetState.initial());

  TextEditingController nameController = TextEditingController();
  String value = '1';
  int? index;
  bool seeOther = false;

  @override
  Future<void> close() {
    nameController.dispose();
    return super.close();
  }

  void selectedOption(String value) {
    if(value == '0'){
      emit(state.copyWith(state: BottomSheetStates.bank, height: 451));
      this.value = value;
    }else if(value == '1'){
      emit(state.copyWith(state: BottomSheetStates.debitCard, height: 254));
      this.value = value;
    }else if(value == '2'){
      emit(state.copyWith(state: BottomSheetStates.initial, height: 254));
      this.value = value;
    }
  }

  void updateSelected(int index){
    if(!seeOther && index == 7){
      seeOther = true;
      this.index = null;
      emit(state.copyWith(state: BottomSheetStates.bank, height: 451,index: index));
    }else{
      this.index = index;
      emit(state.copyWith(state: BottomSheetStates.bank, height: 451,index: index));
    }
  }
}
