// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsernameModelAdapter extends TypeAdapter<UsernameModel> {
  @override
  final int typeId = 0;

  @override
  UsernameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsernameModel(
      usernameField: fields[0] as String,
      matrixIdField: fields[1] as String?,
      lastUpdatedField: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UsernameModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.usernameField)
      ..writeByte(1)
      ..write(obj.matrixIdField)
      ..writeByte(2)
      ..write(obj.lastUpdatedField);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsernameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
