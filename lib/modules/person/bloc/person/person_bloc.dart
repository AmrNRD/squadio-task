import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:squadio/core/utils/core.util.dart';
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
      yield PersonLoadingState();
      if(event is GetPopularPersonsEvent){
     final Map<String,dynamic>data= await personRepository.getPopularPersons(page: event.page);
      yield PersonsLoadedState(data['persons'] as List<Person>,data['page'] as int,data['total_pages'] as int);
      }
    }catch(error){

    }
  }
}
