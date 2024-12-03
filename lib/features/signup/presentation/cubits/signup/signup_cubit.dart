import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState.initial());

  bool passwordVisible = false;
  bool checkboxValue = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    debugPrint('Password visibility: $passwordVisible');
    emit(state.copyWith(isPasswordVisible: passwordVisible));
  }

  void toggleCheckBox() {
    checkboxValue = !checkboxValue;
    debugPrint('Checkbox value: $checkboxValue');
    emit(state.copyWith(isCheckboxChecked: checkboxValue));
  }


}
