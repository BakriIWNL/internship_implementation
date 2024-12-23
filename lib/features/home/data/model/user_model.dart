import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String pinNumber;
  @HiveField(1)
  final List<String> accountNames;
  @HiveField(2)
  final List<String> accountTypes;
  @HiveField(3)
  final List<String> accountAmounts;

  UserModel({
    required this.pinNumber,
    required this.accountNames,
    required this.accountTypes,
    required this.accountAmounts,
  });
}