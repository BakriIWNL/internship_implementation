import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/bottomsheets/log_bottomsheet.dart';
import 'package:itcores_internship_project/core/components/sheet/sheet_information.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/themes/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/features/log/presentation/cubit/item_cubit.dart';
import 'package:itcores_internship_project/features/log/presentation/widgets/dialog_box.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          return LogBottomsheet(
            categoryOnChanged: (String? value) {
              context.read<ItemCubit>().updateCategoryDropDown(value!);
            },
            walletValue: context.read<ItemCubit>().walletValue,
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                  value: '0',
                  child: Text(AppLocalizations.of(context)!.passiveIncome)),
              DropdownMenuItem(
                  value: '1',
                  child: Text(AppLocalizations.of(context)!.salary)),
            ],
            controller: context.read<ItemCubit>().nameController,
            text: AppLocalizations.of(context)!.addAttachment,
            onPressed: () {
              ItemModel item = ItemModel(
                reason: AppStrings.income,
                description: context.read<ItemCubit>().nameController.text,
                amount: 1000,
                dateTime: DateTime.now(),
                expense: false,
              );
              context.read<ItemCubit>().addItem(item);
              if (state.state == GenericStates.success) {
                context.read<ItemCubit>().getItems().then((items) {
                  debugPrint(items[items.length - 1].description);
                });
              }
              if (state.state == GenericStates.error) {
                debugPrint("Error");
              }
              if (state.state == GenericStates.loading) {
                debugPrint("Loading");
              }
              dialogBox(context);
            },
            categoryValue: context.read<ItemCubit>().categoryValue,
            walletOnChanged: (String? value) {
              context.read<ItemCubit>().updateWalletDropDown(value!);
            },
          );
        },
      ),
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
            AppLocalizations.of(context)!.income,
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
        type: AppLocalizations.of(context)!.income,
      ),
    );
  }
}
