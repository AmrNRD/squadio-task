// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tv_series_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesAdapter extends TypeAdapter<TvSeries> {
  @override
  final int typeId = 2;

  @override
  TvSeries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeries(
      id: fields[0] as int,
      name: fields[1] as String,
      originalName: fields[2] as String,
      posterPath: fields[3] as String?,
      overview: fields[4] as String,
      originCountries: (fields[5] as List).cast<String>(),
      genreIds: (fields[6] as List).cast<int>(),
      mediaType: fields[7] as String,
      originalLanguage: fields[8] as String,
      firstAirDate: fields[9] as String,
      backdropPath: fields[10] as String?,
      popularity: fields[11] as double?,
      voteCount: fields[12] as int,
      video: fields[13] as bool,
      videoAverage: fields[14] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeries obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.originalName)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.originCountries)
      ..writeByte(6)
      ..write(obj.genreIds)
      ..writeByte(7)
      ..write(obj.mediaType)
      ..writeByte(8)
      ..write(obj.originalLanguage)
      ..writeByte(9)
      ..write(obj.firstAirDate)
      ..writeByte(10)
      ..write(obj.backdropPath)
      ..writeByte(11)
      ..write(obj.popularity)
      ..writeByte(12)
      ..write(obj.voteCount)
      ..writeByte(13)
      ..write(obj.video)
      ..writeByte(14)
      ..write(obj.videoAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
