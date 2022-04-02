
import 'package:squadio/modules/person/entities/person_entity.dart';

abstract class PersonRepository{
  Future<List<Person>> getPopularPersons({int page=1});
}