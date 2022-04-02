// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../person_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 3;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      id: fields[0] as int,
      name: fields[1] as String,
      profilePath: fields[2] as String?,
      adult: fields[3] as bool,
      popularity: fields[4] as double,
      knownFor: (fields[5] as List).cast<dynamic>(),
      gender: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePath)
      ..writeByte(3)
      ..write(obj.adult)
      ..writeByte(4)
      ..write(obj.popularity)
      ..writeByte(5)
      ..write(obj.knownFor)
      ..writeByte(6)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
