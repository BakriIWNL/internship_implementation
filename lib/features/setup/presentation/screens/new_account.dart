import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:itcores_internship_project/core/components/bottomsheets/bank_bottomsheet.dart';
import 'package:itcores_internship_project/core/components/bottomsheets/default_bottomsheet.dart';
import 'package:itcores_internship_project/core/components/sheet_information.dart';
import 'package:itcores_internship_project/core/routes/route_names.dart';
import 'package:itcores_internship_project/core/utils/app_colors.dart';
import 'package:itcores_internship_project/core/utils/app_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/utils/enums.dart';
import 'package:itcores_internship_project/features/setup/presentation/cubit/bottom_sheet/bottomsheet_cubit.dart';

class NewAccount extends StatelessWidget {
  const NewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BlocBuilder<BottomsheetCubit, BottomsheetState>(
        builder: (context, state) {
          if (state.state == BottomSheetStates.bank) {
            return BankBottomsheet(
              height: state.height,
              onChanged: (value) =>
                  context.read<BottomsheetCubit>().selectedOption(value),
              controller: context.read<BottomsheetCubit>().nameController,
              value: context.read<BottomsheetCubit>().value,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(value: '0', child: Text(AppLocalizations.of(context)!.bank)),
                DropdownMenuItem(value: '1', child: Text(AppLocalizations.of(context)!.debitCard)),
                DropdownMenuItem(value: '2', child: Text(AppLocalizations.of(context)!.creditCard))
              ],
            );
          }else {
            return DefaultBottomSheet(
              height: state.height,
              onChanged: (value) =>
                  context.read<BottomsheetCubit>().selectedOption(value),
              controller: context.read<BottomsheetCubit>().nameController,
              value: context.read<BottomsheetCubit>().value,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(value: '0', child: Text(AppLocalizations.of(context)!.bank)),
                DropdownMenuItem(value: '1', child: Text(AppLocalizations.of(context)!.debitCard)),
                DropdownMenuItem(value: '2', child: Text(AppLocalizations.of(context)!.creditCard))
              ],
            );
          }
        },
      ),
      backgroundColor: AppColors.purplePrimary,
      appBar: AppBar(
        backgroundColor: AppColors.purplePrimary,
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
              context.go(RouteNames.onboarding);
            },
          ),
        ),
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            AppLocalizations.of(context)!.newAccount,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: BlocBuilder<BottomsheetCubit, BottomsheetState>(
        builder: (context, state) {
          return SheetInformation(
            space:
                (580 - context.read<BottomsheetCubit>().state.height).toInt(),
          );
        },
      ),
    );
  }
}
