part of 'person_bloc.dart';

@immutable
abstract class PersonState {}

class PersonInitialState extends PersonState {}

class PersonLoadingState extends PersonState {}

class PersonLoadedState extends PersonState {
  final Person person;
  PersonLoadedState(this.person);
}

class PersonsLoadedState extends PersonState {
  final List<Person> persons;
  PersonsLoadedState(this.persons);
}

class PersonErrorState extends PersonState {
  final String message;
  PersonErrorState(this.message);
}