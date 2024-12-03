part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final int menuIndex;
  const LanguageState({required this.locale, this.menuIndex = 0});

  factory LanguageState.initial() {
    return const LanguageState(locale: Locale('en'), menuIndex: 0);
  }

  LanguageState copyWith({Locale? locale, int? menuIndex}) {
    return LanguageState(
        locale: locale ?? this.locale, menuIndex: menuIndex ?? this.menuIndex);
  }

  @override
  List<Object> get props => [locale, menuIndex];
}
