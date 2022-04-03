part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

class GetPopularPersonsEvent extends PersonEvent {
  final int page;
  GetPopularPersonsEvent({this.page=1});
}

class GetPersonDetailsEvent extends PersonEvent {
  final int id;
  GetPersonDetailsEvent(this.id);
}

class GetPersonPhotosEvent extends PersonEvent {
  final int id;
  GetPersonPhotosEvent(this.id);
}