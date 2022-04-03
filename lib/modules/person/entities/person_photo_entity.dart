
import 'package:squadio/core/utils/core.util.dart';

class PersonPhoto {
  double aspectRatio;
  int height;
  int width;
  String? filePath;
  double voteAverage;
  int voteCount;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  PersonPhoto({
    required this.aspectRatio,
    required this.height,
    required this.width,
    this.filePath,
    required this.voteAverage,
    required this.voteCount,
  });

  PersonPhoto copyWith({
    double? aspectRatio,
    int? height,
    int? width,
    String? filePath,
    double? voteAverage,
    int? voteCount,
  }) {
    return new PersonPhoto(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      width: width ?? this.width,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'PersonPhoto{aspectRatio: $aspectRatio, height: $height, width: $width, filePath: $filePath, voteAverage: $voteAverage, voteCount: $voteCount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonPhoto &&
          runtimeType == other.runtimeType &&
          aspectRatio == other.aspectRatio &&
          height == other.height &&
          width == other.width &&
          filePath == other.filePath &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount);

  @override
  int get hashCode =>
      aspectRatio.hashCode ^
      height.hashCode ^
      width.hashCode ^
      filePath.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;

  factory PersonPhoto.fromJson(Map<String, dynamic> map) {

     return new PersonPhoto(
       aspectRatio: double.parse(map['aspect_ratio'].toString()),
       height: int.parse(map['height'].toString()),
       width: int.parse(map['width'].toString()),
       filePath: map['file_path'].toString(),
       voteAverage: double.parse(map['vote_average'].toString()),
       voteCount: int.parse(map['vote_count'].toString()),
     );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'aspectRatio': this.aspectRatio,
      'height': this.height,
      'width': this.width,
      'filePath': this.filePath,
      'voteAverage': this.voteAverage,
      'voteCount': this.voteCount,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}