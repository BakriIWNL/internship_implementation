import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidationConditions{

  static final Map<String,String? Function(String?, BuildContext)?> validator = {
    "Email":emailValidator,
    "Password": passwordValidator,
    "Name":nameValidator
  };

  static String? emailValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.localizations.emailEmpty;
    }
    if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return context.localizations.emailInvalid;
    }
    return null;
  }

  static String? passwordValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.localizations.passwordEmpty;
    }
    if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      return context.localizations.passwordOneUppercase;
    }
    if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      return context.localizations.passwordOneLowercase;
    }
    if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return context.localizations.passwordOneNumber;
    }
    if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      return context.localizations.passwordOneSpecial;
    }
    if (!RegExp(r'^.{8,}$').hasMatch(value)) {
      return context.localizations.passwordLength;
    }
    return null;
  }

  static String? nameValidator(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.localizations.nameEmpty;
    }
    return null;
  }
}

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}