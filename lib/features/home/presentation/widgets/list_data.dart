import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/item/custom_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListData extends StatelessWidget {
  // final List<String> items;

  // ListData({required this.items});

  @override
  Widget build(BuildContext context) {
    final List<String> reasons = [
      AppLocalizations.of(context)!.shopping,
      AppLocalizations.of(context)!.subscription,
      AppLocalizations.of(context)!.food,
      AppLocalizations.of(context)!.transport,
      AppLocalizations.of(context)!.salary,
      AppLocalizations.of(context)!.passiveIncome
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
