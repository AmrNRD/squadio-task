

import 'package:squadio/core/api_caller.dart';
import 'package:squadio/env.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/person_photo_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_repository.dart';

class PersonOnlineDataRepository extends PersonRepository{
  @override
  Future<Map<String,dynamic>> getPopularPersons({int page = 1}) async {
    final responseData = await APICaller.getData("/person/popular?page=$page&api_key=${Env.token}", authorizedHeader: true);
    final Map<String,dynamic>data={};

    final List<Person> persons = [];
    if((responseData as Map).containsKey('results')) {
      for (final listData in responseData['results']) {
        persons.add(Person.fromJson(listData as Map<String, dynamic>));
      }
    }
    data['persons']=persons;

    data['page']=int.tryParse(responseData["page"].toString());

    data['total_pages']=int.tryParse(responseData['total_pages'].toString());

    return data;

  }



  @override
  Future<List<PersonPhoto>> getPersonPhotos(int id) async {
    final responseData = await APICaller.getData("/person/$id/images?api_key=${Env.token}", authorizedHeader: true);
    final List<PersonPhoto> personPhotos = [];
    if((responseData as Map).containsKey('profiles')) {
      for (final listData in responseData['profiles']) {
        personPhotos.add(PersonPhoto.fromJson(listData as Map<String, dynamic>));
      }
    }
    return personPhotos;
  }

  @override
  Future<Person> getPersonDetails(int id) async {
    final responseData = await APICaller.getData("/person/$id?api_key=${Env.token}", authorizedHeader: true);
    return Person.fromJson(responseData);
  }

}