// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorsAdapter extends TypeAdapter<Doctors> {
  @override
  final int typeId = 1;

  @override
  Doctors read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Doctors(
      name: fields[0] as String,
      specialty: fields[1] as String,
      crm: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Doctors obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.specialty)
      ..writeByte(2)
      ..write(obj.crm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
