import 'package:flutter/material.dart';
import 'package:itcores_internship_project/core/components/bottomsheets/default_bottomsheet.dart';
import 'package:itcores_internship_project/core/components/sheet_screen.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SheetScreen(
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return DefaultBottomsheet();
        },
        enableDrag: false,
      ),
    );
  }
}
