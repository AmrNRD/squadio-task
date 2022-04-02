

import 'package:hive_flutter/hive_flutter.dart';
import 'package:squadio/core/api_caller.dart';
import 'package:squadio/env.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_repository.dart';

class PersonOfflineDataRepository extends PersonRepository{
  @override
  Future<Map<String,dynamic>> getPopularPersons({int page = 1}) async {
    var box = await Hive.openBox('squadioBox');
    final Map<String,dynamic>data={};
    List<Person> persons=box.get("persons",defaultValue: []);

    data['persons']=persons;

    data['page']=1;

    data['total_pages']=1;

    return data;
  }

}