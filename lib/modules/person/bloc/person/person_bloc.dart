import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_repository.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  // ignore: non_constant_identifier_names
  String TAG="PersonBloc";
  PersonBloc(this.personRepository) : super(PersonInitialState());
  final PersonRepository personRepository;

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    try{
      if(event is GetPopularPersonsEvent){
      List<Person>persons= await personRepository.getPopularPersons(page: event.page);
      yield PersonsLoadedState(persons);
      }
    }catch(error){

    }
  }
}
