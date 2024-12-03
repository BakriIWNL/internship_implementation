import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenState.active());

  Future<void> splashScreenCycle() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(
      state.copyWith(
        state: SplashStates.concluded,
      ),
    );
  }
}
