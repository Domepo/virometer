// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states_checked_hivedb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatesCheckAdapter extends TypeAdapter<StatesCheck> {
  @override
  final int typeId = 0;

  @override
  StatesCheck read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatesCheck(
      name: fields[0] as String,
      state: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, StatesCheck obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.state);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatesCheckAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
