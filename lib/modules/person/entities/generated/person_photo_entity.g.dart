// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../person_photo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonPhotoAdapter extends TypeAdapter<PersonPhoto> {
  @override
  final int typeId = 4;

  @override
  PersonPhoto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonPhoto(
      aspectRatio: fields[0] as double,
      height: fields[1] as int,
      width: fields[2] as int,
      filePath: fields[3] as String?,
      voteAverage: fields[4] as double,
      voteCount: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PersonPhoto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.aspectRatio)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.filePath)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonPhotoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
