

import 'package:hive_flutter/hive_flutter.dart';
import 'package:squadio/core/api_caller.dart';
import 'package:squadio/env.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/person_photo_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_repository.dart';

class PersonOfflineDataRepository extends PersonRepository{
  @override
  Future<Map<String,dynamic>> getPopularPersons({int page = 1}) async {
    var persons = await Hive.openBox<Person>('persons');
    final Map<String,dynamic>data={};


    data['persons']=persons.values.toList().cast<Person>();

    data['page']=1;

    data['total_pages']=1;

    return data;
  }

  @override
  Future<List<PersonPhoto>> getPersonPhotos(int id) {
    // TODO: implement getPersonPhotos
    throw UnimplementedError();
  }

  @override
  Future<Person> getPersonDetails(int id) {
    // TODO: implement getPersonDetails
    throw UnimplementedError();
  }

}