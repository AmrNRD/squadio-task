// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 1;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String?,
      adult: fields[3] as bool,
      overview: fields[4] as String,
      genreIds: (fields[5] as List).cast<int>(),
      releaseDate: fields[6] as String,
      mediaType: fields[7] as String,
      originalLanguage: fields[8] as String,
      backdropPath: fields[9] as String?,
      popularity: fields[10] as double,
      voteCount: fields[11] as double,
      video: fields[12] as bool,
      videoAverage: fields[13] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.adult)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.genreIds)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.mediaType)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.backdropPath)
      ..writeByte(10)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.voteCount)
      ..writeByte(12)
      ..write(obj.video)
      ..writeByte(13)
      ..write(obj.videoAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
