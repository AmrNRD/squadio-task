part of 'person_bloc.dart';

@immutable
abstract class PersonState {}

class PersonInitialState extends PersonState {}

class PersonLoadingState extends PersonState {}

class PersonLoadedState extends PersonState {
  final Person person;
  PersonLoadedState(this.person);
}

class PersonPhotosLoadedState extends PersonState {
  final List<PersonPhoto> personPhotos;
  PersonPhotosLoadedState(this.personPhotos);
}

class PersonsLoadedState extends PersonState {
  final List<Person> persons;
  final int page;
  final int totalNumberOfPage;
  PersonsLoadedState(this.persons,this.page,this.totalNumberOfPage);
}

class PersonErrorState extends PersonState {
  final String message;
  PersonErrorState(this.message);
}