import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/item/custom_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:itcores_internship_project/core/utils/app_strings.dart';

class FakeExample extends StatelessWidget {
  // final List<String> items;

  // ListData({required this.items});

  @override
  Widget build(BuildContext context) {
    final List<String> reasons = [
      AppStrings.shopping,
      AppStrings.subscription,
      AppStrings.food,
      AppStrings.transport,
      AppStrings.salary,
      AppStrings.passiveIncome
    ];

    final List<int> amount = [
      100,
      200,
      300,
      400,
      500,
      600,
    ];

    final String description = AppLocalizations.of(context)!.description;
    return SizedBox(
      height: 142.h,
      width: 336.w,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CustomItem(
                    reason: reasons[index],
                    amount: amount[index],
                    dateTime: DateTime.now(),
                    description: description);
              },
              childCount: reasons.length,
            ),
          ),
        ],
      ),
    );
  }
}
