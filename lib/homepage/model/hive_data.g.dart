// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDataAdapter extends TypeAdapter<HiveData> {
  @override
  final int typeId = 0;

  @override
  HiveData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveData(
      id: fields[0] as int,
      title: fields[1] as String,
      dec: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.dec);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
