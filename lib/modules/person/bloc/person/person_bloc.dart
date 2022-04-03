import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:squadio/core/utils/core.util.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/person_photo_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_offline_data_repository.dart';
import 'package:squadio/modules/person/repositories/person/person_online_data_repository.dart';
import 'package:squadio/modules/person/repositories/person/person_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  // ignore: non_constant_identifier_names
  String TAG="PersonBloc";
  PersonBloc(this.personRepository):super(PersonInitialState()){
    _personOfflineDataRepository=PersonOfflineDataRepository();
  }
  final PersonRepository personRepository;
  late PersonOfflineDataRepository _personOfflineDataRepository;

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    try{
      yield PersonLoadingState();
      yield await processEvent(personRepository,event);
    }catch(error,st) {
      CoreUtility.safePrint("$TAG Exception of type ${error.runtimeType} using the main repo with message ${error.toString()}");
      CoreUtility.safePrint(st);
      try{
        yield await processEvent(_personOfflineDataRepository,event);
      }catch(error,st){
        CoreUtility.safePrint("$TAG Exception of type ${error.runtimeType} using the offline repo with message ${error.toString()}");
        CoreUtility.safePrint(st);
        yield PersonErrorState(error.toString());
      }
    }
  }

  Future<PersonState> processEvent(PersonRepository personRepository,PersonEvent event) async {
    try{
      if(event is GetPopularPersonsEvent){
        final Map<String,dynamic>data= await personRepository.getPopularPersons(page: event.page);
        if(personRepository is PersonOnlineDataRepository){
          _personOfflineDataRepository.setPopularPersonsInStorage(data['persons'] as List<Person>);
        }
        return PersonsLoadedState(data['persons'] as List<Person>,data['page'] as int,data['total_pages'] as int);

      }else if(event is GetPersonDetailsEvent){
        Person person= await personRepository.getPersonDetails(event.id);
        if(personRepository is PersonOnlineDataRepository){
          _personOfflineDataRepository.setPersonsDetailsInStorage(person);
        }
        return PersonLoadedState(person);
      }else if(event is GetPersonPhotosEvent){
        List<PersonPhoto> personPhotos= await personRepository.getPersonPhotos(event.id);
        if(personRepository is PersonOnlineDataRepository){
          _personOfflineDataRepository.setPersonsPhotosInStorage(event.id,personPhotos);
        }
        return PersonPhotosLoadedState(personPhotos);
      }else{
        return PersonLoadingState();
      }
    }catch(error){
      throw error;
    }
  }
}
