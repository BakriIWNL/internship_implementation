import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState.initial());

  void changeLanguage(Locale locale){
    if(locale ==  const Locale('ar')){
      emit(state.copyWith(locale: const Locale('ar')));
      return;
    }
    if(locale ==  const Locale('en')){
      emit(state.copyWith(locale:  const Locale('en')));
    }
  }

  void changeMenuIndex(int index){
    emit(state.copyWith(menuIndex: index,locale: state.locale));
  }
}