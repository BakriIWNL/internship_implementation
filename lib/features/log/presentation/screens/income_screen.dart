import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:itcores_internship_project/core/components/bottomsheets/log_bottomsheet.dart';
import 'package:itcores_internship_project/core/components/sheet/sheet_information.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/features/log/data/item_model.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      bottomSheet: LogBottomsheet(
          onChanged: () {},
          value: '0',
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem(
                value: '0', child: Text("Passive Income")),
            DropdownMenuItem(
                value: '1',
                child: Text("Salary")),
          ],
          controller: nameController, text: 'Add attachment', onPressed: (){
            Box<ItemModel> itemBox = Hive.box<ItemModel>('items');
            itemBox.add(ItemModel(
              reason: 'Reason', 
              description: 'Description',
              amount: 0, 
              dateTime: DateTime.now(), 
              expense: false,
            ));
          },),
      backgroundColor: AppColors.greenPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.greenPrimary,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        leading: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: IconButton(
            icon: AppIcons.arrowBackWhite,
            onPressed: () {
              context.go(RouteNames.home);
            },
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            "Income",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SheetInformation(
        space: 100.h.toInt(),
        textColor: AppColors.greenSecondary,
        type: "Income",
      ),
    );
  }
}
