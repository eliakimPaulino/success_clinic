// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../medico.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicoAdapter extends TypeAdapter<Medico> {
  @override
  final int typeId = 0;

  @override
  Medico read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medico(
      nome: fields[0] as String,
      especialidade: fields[1] as String,
      photo: fields[2] as String? ?? '', // Default to empty string if photo is not provided
    );
  }

  @override
  void write(BinaryWriter writer, Medico obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.especialidade)
      ..writeByte(2)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
