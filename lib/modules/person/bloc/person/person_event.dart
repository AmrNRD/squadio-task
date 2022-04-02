part of 'person_bloc.dart';

@immutable
abstract class PersonEvent {}

class GetPopularPersonsEvent extends PersonEvent {
  final int page;
  GetPopularPersonsEvent({this.page=1});
}