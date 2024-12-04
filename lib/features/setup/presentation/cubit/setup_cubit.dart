import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(SetupState.initial());

  TextEditingController pinController = TextEditingController();

  @override
  Future<void> close(){
    pinController.dispose();
    return super.close();
  }

  bool checkComplete(int length){
    if(length==4){
      return true;
    }
    return false;
  }

  // bool checkFull(int){

  // }
}
