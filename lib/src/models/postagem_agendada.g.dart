// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postagem_agendada.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostagemAgendadaAdapter extends TypeAdapter<PostagemAgendada> {
  @override
  final int typeId = 0;

  @override
  PostagemAgendada read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostagemAgendada(
      id: fields[0] as String,
      titulo: fields[1] as String,
      descricao: fields[2] as String,
      dataPublicacao: fields[3] as DateTime,
      dataCriacao: fields[4] as DateTime,
      mediaPaths: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostagemAgendada obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.descricao)
      ..writeByte(3)
      ..write(obj.dataPublicacao)
      ..writeByte(4)
      ..write(obj.dataCriacao)
      ..writeByte(5)
      ..write(obj.mediaPaths);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostagemAgendadaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
