import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close(){
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    debugPrint('Password visibility: $passwordVisible');
    emit(state.copyWith(isPasswordVisible: passwordVisible));
  }
}
