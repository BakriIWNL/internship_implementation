// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      pinNumber: fields[0] as String,
      accountNames: (fields[1] as List).cast<String>(),
      accountTypes: (fields[2] as List).cast<String>(),
      accountAmounts: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pinNumber)
      ..writeByte(1)
      ..write(obj.accountNames)
      ..writeByte(2)
      ..write(obj.accountTypes)
      ..writeByte(3)
      ..write(obj.accountAmounts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
