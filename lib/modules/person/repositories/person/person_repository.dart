
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/person_photo_entity.dart';

abstract class PersonRepository{
  Future<Map<String,dynamic>> getPopularPersons({int page=1});
  Future<Person> getPersonDetails(int id);
  Future<List<PersonPhoto>> getPersonPhotos(int id);
}