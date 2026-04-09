// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionModelAdapter extends TypeAdapter<SubscriptionModel> {
  @override
  final int typeId = 10;

  @override
  SubscriptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionModel(
      stripeSubscriptionIdField: fields[0] as String?,
      statusField: fields[1] as String,
      currentPeriodEndField: fields[2] as DateTime?,
      cancelAtPeriodEndField: fields[3] as bool,
      stripeCustomerIdField: fields[4] as String?,
      createdAtField: fields[5] as DateTime?,
      canceledAtField: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.stripeSubscriptionIdField)
      ..writeByte(1)
      ..write(obj.statusField)
      ..writeByte(2)
      ..write(obj.currentPeriodEndField)
      ..writeByte(3)
      ..write(obj.cancelAtPeriodEndField)
      ..writeByte(4)
      ..write(obj.stripeCustomerIdField)
      ..writeByte(5)
      ..write(obj.createdAtField)
      ..writeByte(6)
      ..write(obj.canceledAtField);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
