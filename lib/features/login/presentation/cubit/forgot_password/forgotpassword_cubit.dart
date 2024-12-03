import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'forgotpassword_state.dart';

class ForgotpasswordCubit extends Cubit<ForgotpasswordState> {
  ForgotpasswordCubit() : super(ForgotpasswordState.initial());

  TextEditingController emailController = TextEditingController();
  @override
  Future<void> close(){
    
    emailController.dispose();
    return super.close();
  }
}
