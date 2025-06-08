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
    );
  }

  @override
  void write(BinaryWriter writer, Medico obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.especialidade);
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
