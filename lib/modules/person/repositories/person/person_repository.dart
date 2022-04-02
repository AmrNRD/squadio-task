
import 'package:squadio/modules/person/entities/person_entity.dart';

abstract class PersonRepository{
  Future<Map<String,dynamic>> getPopularPersons({int page=1});
}