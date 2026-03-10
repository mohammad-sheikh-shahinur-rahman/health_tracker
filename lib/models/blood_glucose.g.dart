// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_glucose.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BloodGlucoseAdapter extends TypeAdapter<BloodGlucose> {
  @override
  final int typeId = 2;

  @override
  BloodGlucose read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BloodGlucose(
      level: fields[0] as double,
      timestamp: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BloodGlucose obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.level)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BloodGlucoseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
