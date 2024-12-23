import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SheetData {

  SheetData({required this.title,required this.header});

  final String title;
  final String header;

  static Map<String,SheetData> getSheetData(BuildContext context){ 
    return {
      context.loc.expenses:SheetData(title: context.loc.expenses,header: context.loc.howMuch),
      context.loc.income:SheetData(title: context.loc.income,header: context.loc.howMuch),
      context.loc.balance:SheetData(title: context.loc.addNewWallet,header: context.loc.balance),
    };
  }
}

extension AppLocalizationsExtensions on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}