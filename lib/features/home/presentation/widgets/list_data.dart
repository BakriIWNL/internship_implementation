import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/item/custom_item.dart';

class ListData extends StatelessWidget {
  // final List<String> items;

  // ListData({required this.items});

  final List<String> reasons = [
    "Shopping",
    "Subscription",
    "Food",
    "Transportation",
    "Salary",
    "Passive Income"
  ];

  final List<int> amount = [
    100,
    200,
    300,
    400,
    500,
    600,
  ];

  final String description = "Description";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 142.h,
      width: 336.w,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CustomItem(reason: reasons[index], amount: amount[index], dateTime: DateTime.now(), description: description);
              },
              childCount: reasons.length,
            ),
          ),
        ],
      ),
    );
  }
}