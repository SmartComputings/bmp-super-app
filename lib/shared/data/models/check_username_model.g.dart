// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_username_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckUsernameModelAdapter extends TypeAdapter<CheckUsernameModel> {
  @override
  final int typeId = 14;

  @override
  CheckUsernameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckUsernameModel(
      existsField: fields[0] as bool,
      hasCustomerField: fields[1] as bool,
      customerIdField: fields[2] as String?,
      emailField: fields[3] as String?,
      firstNameField: fields[4] as String?,
      lastNameField: fields[5] as String?,
      phoneField: fields[6] as String?,
      subscriptionStatusField: fields[7] as String?,
      subscriptionExpiresAtField: fields[8] as DateTime?,
      hasPayCryptoField: fields[9] as bool,
      paycryptoJsonField: fields[10] as String?,
      pinSetField: fields[11] as bool,
      cachedAtField: fields[12] as DateTime,
      statusField: fields[13] as String?,
      typeField: fields[14] as String?,
      endorsementsJsonField: fields[15] as String?,
      stripeCustomerIdField: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckUsernameModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.existsField)
      ..writeByte(1)
      ..write(obj.hasCustomerField)
      ..writeByte(2)
      ..write(obj.customerIdField)
      ..writeByte(3)
      ..write(obj.emailField)
      ..writeByte(4)
      ..write(obj.firstNameField)
      ..writeByte(5)
      ..write(obj.lastNameField)
      ..writeByte(6)
      ..write(obj.phoneField)
      ..writeByte(7)
      ..write(obj.subscriptionStatusField)
      ..writeByte(8)
      ..write(obj.subscriptionExpiresAtField)
      ..writeByte(9)
      ..write(obj.hasPayCryptoField)
      ..writeByte(10)
      ..write(obj.paycryptoJsonField)
      ..writeByte(11)
      ..write(obj.pinSetField)
      ..writeByte(12)
      ..write(obj.cachedAtField)
      ..writeByte(13)
      ..write(obj.statusField)
      ..writeByte(14)
      ..write(obj.typeField)
      ..writeByte(15)
      ..write(obj.endorsementsJsonField)
      ..writeByte(16)
      ..write(obj.stripeCustomerIdField);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckUsernameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
