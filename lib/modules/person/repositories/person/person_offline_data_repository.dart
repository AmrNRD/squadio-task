

import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:squadio/core/utils/core.util.dart';
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


  setPopularPersonsInStorage(List<Person> persons) async {
    try{
      var box = await Hive.openBox('persons');
      await box.addAll(persons);
    }catch(error,st){
      CoreUtility.safePrint(error);
      CoreUtility.safePrint(st);
    }
  }

  setPersonsDetailsInStorage(Person person) async {
    try{
      var box = await Hive.openBox('personDetails');
      await box.put(person.id.toString(),person);
    }catch(error,st){
      CoreUtility.safePrint(error);
      CoreUtility.safePrint(st);
    }
  }

  setPersonsPhotosInStorage(int id,List<PersonPhoto> personPhoto) async {
    try{
      var box = await Hive.openBox('personPhotos');
      await box.put(id.toString(),personPhoto);
    }catch(error,st){
      CoreUtility.safePrint(error);
      CoreUtility.safePrint(st);
    }
  }

  @override
  Future<List<PersonPhoto>> getPersonPhotos(int id) async {
    var personPhotosBox = await Hive.openBox<List<PersonPhoto>>('personPhotos');
    List<PersonPhoto>? personPhotos=personPhotosBox.get(id.toString());
    if(personPhotos!=null){
      return personPhotos;
    }else{
      throw HttpException("Not in storage");
    }
  }

  @override
  Future<Person> getPersonDetails(int id) async {
    var personDetailsBox = await Hive.openBox<Person>('personDetails');
    Person? person=personDetailsBox.get(id.toString());
    if(person!=null){
      return person;
    }else{
       throw HttpException("Not in storage");
    }
  }

}