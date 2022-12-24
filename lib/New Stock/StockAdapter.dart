
// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

import 'package:hive/hive.dart';
import 'package:mycompta/New%20Stock/Stock.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      fields[0] as String,
      fields[1] as String,
       fields[2] as String,
      fields[3] as String,
      fields[4] as String,
     
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.prix)
      ..writeByte(2)
      ..write(obj.qte)
      ..writeByte(3)
      ..write(obj.ment)
      ..writeByte(4)
      ..write(obj.path);
    
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}


class CategorieAdapter extends TypeAdapter<Categorie> {
  @override
  final int typeId = 2;

  @override
  Categorie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorie(
      fields[0] as String,
     
    );
  }
  @override
  void write(BinaryWriter writer, Categorie obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name)
  ;
    
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;

}