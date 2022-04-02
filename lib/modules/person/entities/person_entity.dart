
import 'package:hive/hive.dart';
import 'package:squadio/modules/person/entities/movie_entity.dart';
import 'package:squadio/modules/person/entities/tv_series_entity.dart';

part 'generated/person_entity.g.dart';
@HiveType(typeId: 3)
class Person {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? profilePath;
  @HiveField(3)
  final bool adult;
  @HiveField(4)
  final double popularity;
  @HiveField(5)
  final List<dynamic> knownFor;
  @HiveField(6)
  final int gender;


//<editor-fold desc="Data Methods" defaultstate="collapsed">

  Person({
    required this.id,
    required this.name,
    this.profilePath,
    required this.adult,
    required this.popularity,
    required this.knownFor,
    required this.gender
  });

  Person copyWith({
    int? id,
    String? name,
    String? profilePath,
    bool? adult,
    double? popularity,
    List<dynamic>? knownFor,
    int? gender
  }) {
    return new Person(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePath: profilePath ?? this.profilePath,
      adult: adult ?? this.adult,
      popularity: popularity ?? this.popularity,
      knownFor: knownFor ?? this.knownFor,
      gender: gender ?? this.gender
    );
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, profilePath: $profilePath, adult: $adult, popularity: $popularity, knownFor: $knownFor}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Person &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          profilePath == other.profilePath &&
          adult == other.adult &&
          popularity == other.popularity &&
          knownFor == other.knownFor);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      profilePath.hashCode ^
      adult.hashCode ^
      popularity.hashCode ^
      knownFor.hashCode;

  factory Person.fromJson(Map<String, dynamic> map) {
    return new Person(
      id: int.parse(map['id'].toString()),
      name: map['name'].toString(),
      profilePath: map['profile_path']?.toString(),
      adult: map['adult'].toString()=="true",
      popularity: double.parse(map['popularity'].toString()),
      gender: int.parse(map['gender'].toString()),
      knownFor: [],
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'name': this.name,
      'profilePath': this.profilePath,
      'adult': this.adult,
      'popularity': this.popularity,
      'knownFor': this.knownFor,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}