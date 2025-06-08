// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../medicamento.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicamentoAdapter extends TypeAdapter<Medicamento> {
  @override
  final int typeId = 1;

  @override
  Medicamento read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Medicamento(
      nome: fields[0] as String,
      dosagem: fields[1] as String,
      data: fields[2] as DateTime,
      intervalo: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Medicamento obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.dosagem)
      ..writeByte(2)
      ..write(obj.data)
      ..writeByte(3)
      ..write(obj.intervalo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicamentoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
