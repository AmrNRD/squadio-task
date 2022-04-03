
import 'package:hive/hive.dart';

part 'generated/tv_series_entity.g.dart';
@HiveType(typeId: 2)
class TvSeries extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String originalName;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final List<String> originCountries;
  @HiveField(6)
  final List<int> genreIds;
  @HiveField(7)
  final String mediaType;
  @HiveField(8)
  final String originalLanguage;
  @HiveField(9)
  final String firstAirDate;
  @HiveField(10)
  final String? backdropPath;
  @HiveField(11)
  final double? popularity;
  @HiveField(12)
  final int voteCount;
  @HiveField(13)
  final bool video;
  @HiveField(14)
  final double? videoAverage;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  TvSeries({
    required this.id,
    required this.name,
    required this.originalName,
    this.posterPath,
    required this.overview,
    required this.originCountries,
    required this.genreIds,
    required this.mediaType,
    required this.originalLanguage,
    required this.firstAirDate,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.videoAverage,
  });

  TvSeries copyWith({
    int? id,
    String? name,
    String? originalName,
    String? posterPath,
    String? overview,
    List<String>? originCountries,
    List<int>? genreIds,
    String? mediaType,
    String? originalLanguage,
    String? firstAirDate,
    String? backdropPath,
    double? popularity,
    int? voteCount,
    bool? video,
    double? videoAverage,
  }) {
    return new TvSeries(
      id: id ?? this.id,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      originCountries: originCountries ?? this.originCountries,
      genreIds: genreIds ?? this.genreIds,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      firstAirDate: firstAirDate ?? this.firstAirDate,
      backdropPath: backdropPath ?? this.backdropPath,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      videoAverage: videoAverage ?? this.videoAverage,
    );
  }

  @override
  String toString() {
    return 'TvSeries{id: $id, name: $name, originalName: $originalName, posterPath: $posterPath, overview: $overview, originCountries: $originCountries, genreIds: $genreIds, mediaType: $mediaType, originalLanguage: $originalLanguage, firstAirDate: $firstAirDate, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, videoAverage: $videoAverage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TvSeries &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          originalName == other.originalName &&
          posterPath == other.posterPath &&
          overview == other.overview &&
          originCountries == other.originCountries &&
          genreIds == other.genreIds &&
          mediaType == other.mediaType &&
          originalLanguage == other.originalLanguage &&
          firstAirDate == other.firstAirDate &&
          backdropPath == other.backdropPath &&
          popularity == other.popularity &&
          voteCount == other.voteCount &&
          video == other.video &&
          videoAverage == other.videoAverage);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      originalName.hashCode ^
      posterPath.hashCode ^
      overview.hashCode ^
      originCountries.hashCode ^
      genreIds.hashCode ^
      mediaType.hashCode ^
      originalLanguage.hashCode ^
      firstAirDate.hashCode ^
      backdropPath.hashCode ^
      popularity.hashCode ^
      voteCount.hashCode ^
      video.hashCode ^
      videoAverage.hashCode;

  factory TvSeries.fromJson(Map<String, dynamic> map) {
     return  TvSeries(
       id: int.parse(map['id'].toString()),
       name: map['name'].toString(),
       originalName: map['original_name'].toString(),
       posterPath: map['poster_path']?.toString(),
       overview: map['overview'].toString(),
       genreIds: map['genre_ids']!=null?List<int>.from((map['genre_ids'] as List).map((item) => int.parse(item.toString()))):[],
       originCountries: map['origin_country']!=null?List<String>.from((map['origin_country'] as List).map((item) => item.toString())):[],
       mediaType: map['media_type'].toString(),
       originalLanguage: map['original_language'].toString(),
       firstAirDate: map['first_air_date'].toString(),
       backdropPath: map['backdrop_path']?.toString(),
       popularity: double.tryParse(map['popularity'].toString()),
       voteCount: int.parse(map['vote_count'].toString()),
       video: map['video'].toString()=="true",
       videoAverage: double.tryParse(map['video_average'].toString()),
     );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'original_name': this.originalName,
      'poster_path': this.posterPath,
      'overview': this.overview,
      'origin_country': this.originCountries,
      'genreIds': this.genreIds,
      'mediaType': this.mediaType,
      'original_language': this.originalLanguage,
      'first_air_date': this.firstAirDate,
      'backdrop_path': this.backdropPath,
      'popularity': this.popularity,
      'vote_count': this.voteCount,
      'video': this.video,
      'videoAverage': this.videoAverage,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}