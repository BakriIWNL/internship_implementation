import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';

class SheetData {

  SheetData({required this.title,required this.header});

  final String title;
  final String header;

  static Map<String,SheetData> getSheetData(BuildContext context){ 
    return {
      AppStrings.expense:SheetData(title: context.localizations.expenses,header: context.localizations.howMuch),
      AppStrings.income:SheetData(title: context.localizations.income,header: context.localizations.howMuch),
      AppStrings.balance:SheetData(title: context.localizations.addNewWallet,header: context.localizations.balance),
    };
  }
}

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}