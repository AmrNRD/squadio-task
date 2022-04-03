import 'package:hive/hive.dart';

part 'generated/movie_entity.g.dart';

@HiveType(typeId: 1)
class Movie extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? posterPath;
  @HiveField(3)
  final bool adult;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final List<int> genreIds;
  @HiveField(6)
  final String releaseDate;
  @HiveField(7)
  final String mediaType;
  @HiveField(8)
  final String originalLanguage;
  @HiveField(9)
  final String? backdropPath;
  @HiveField(10)
  final double? popularity;
  @HiveField(11)
  final double? voteCount;
  @HiveField(12)
  final bool video;
  @HiveField(13)
  final double? videoAverage;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Movie({
    required this.id,
    required this.title,
    this.posterPath,
    required this.adult,
    required this.overview,
    required this.genreIds,
    required this.releaseDate,
    required this.mediaType,
    required this.originalLanguage,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.videoAverage,
  });

  Movie copyWith({
    int? id,
    String? title,
    String? posterPath,
    bool? adult,
    String? overview,
    List<int>? genreIds,
    String? releaseDate,
    String? mediaType,
    String? originalLanguage,
    String? backdropPath,
    double? popularity,
    double? voteCount,
    bool? video,
    double? videoAverage,
  }) {
    return new Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      adult: adult ?? this.adult,
      overview: overview ?? this.overview,
      genreIds: genreIds ?? this.genreIds,
      releaseDate: releaseDate ?? this.releaseDate,
      mediaType: mediaType ?? this.mediaType,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      backdropPath: backdropPath ?? this.backdropPath,
      popularity: popularity ?? this.popularity,
      voteCount: voteCount ?? this.voteCount,
      video: video ?? this.video,
      videoAverage: videoAverage ?? this.videoAverage,
    );
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, posterPath: $posterPath, adult: $adult, overview: $overview, genreIds: $genreIds, releaseDate: $releaseDate, mediaType: $mediaType, originalLanguage: $originalLanguage, backdropPath: $backdropPath, popularity: $popularity, voteCount: $voteCount, video: $video, videoAverage: $videoAverage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Movie &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              posterPath == other.posterPath &&
              adult == other.adult &&
              overview == other.overview &&
              genreIds == other.genreIds &&
              releaseDate == other.releaseDate &&
              mediaType == other.mediaType &&
              originalLanguage == other.originalLanguage &&
              backdropPath == other.backdropPath &&
              popularity == other.popularity &&
              voteCount == other.voteCount &&
              video == other.video &&
              videoAverage == other.videoAverage);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      posterPath.hashCode ^
      adult.hashCode ^
      overview.hashCode ^
      genreIds.hashCode ^
      releaseDate.hashCode ^
      mediaType.hashCode ^
      originalLanguage.hashCode ^
      backdropPath.hashCode ^
      popularity.hashCode ^
      voteCount.hashCode ^
      video.hashCode ^
      videoAverage.hashCode;

  factory Movie.fromJson(Map<String, dynamic> map) {
    return new Movie(
      id: int.parse(map['id'].toString()),
      title: map['title'].toString(),
      posterPath: map['poster_path']?.toString(),
      adult: map['adult'].toString()=="true",
      overview: map['overview'].toString(),
      genreIds: map['genre_ids']!=null?List<int>.from((map['genre_ids'] as List).map((item) => int.parse(item.toString()))):[],
      releaseDate: map['release_date'].toString(),
      mediaType: map['media_type'].toString(),
      originalLanguage: map['original_language'].toString(),
      backdropPath: map['backdrop_path']?.toString(),
      popularity: double.tryParse(map['popularity'].toString()),
      voteCount: double.tryParse(map['vote_count'].toString()),
      video: map['video'].toString()=="true",
      videoAverage: double.tryParse(map['video_average'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'title': this.title,
      'poster_path': this.posterPath,
      'adult': this.adult,
      'overview': this.overview,
      'genre_ids': this.genreIds,
      'release_date': this.releaseDate,
      'media_type': this.mediaType,
      'original_language': this.originalLanguage,
      'backdrop_path': this.backdropPath,
      'popularity': this.popularity,
      'vote_count': this.voteCount,
      'video': this.video,
      'video_average': this.videoAverage,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}