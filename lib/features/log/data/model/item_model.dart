import 'package:hive/hive.dart';
part 'item_model.g.dart';


@HiveType(typeId: 1)
class ItemModel {
  @HiveField(0)
  final String reason;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final bool expense;
  @HiveField(5)
  final String? imagePath;

  ItemModel({required this.reason, required this.description, required this.amount,required this.dateTime, required this.expense,this.imagePath});
}