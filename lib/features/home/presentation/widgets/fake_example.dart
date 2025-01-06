import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itcores_internship_project/core/components/item/custom_item.dart';
import 'package:itcores_internship_project/features/log/data/model/item_model.dart';
import 'package:itcores_internship_project/features/log/presentation/cubit/item_cubit.dart';

class FakeExample extends StatelessWidget {
  const FakeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemModel>>(
      future: context.read<ItemCubit>().getItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No items found'));
        } else {
          final items = snapshot.data!;
          return SizedBox(
            height: 200.h,
            width: 336.w,
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CustomItem(
                          reason: items[index].reason,
                          amount: items[index].amount,
                          dateTime: items[index].dateTime,
                          description: items[index].description,);
                    },
                    childCount: items.length,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
