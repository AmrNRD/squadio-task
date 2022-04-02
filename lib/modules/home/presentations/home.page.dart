import 'package:flutter/material.dart';
import 'package:squadio/modules/person/bloc/person/person_bloc.dart';
import 'package:squadio/modules/person/repositories/person/person_online_data_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersonBloc _personBloc;

  @override
  void initState() {
    _personBloc=PersonBloc(PersonOnlineDataRepository());
    _personBloc.add(GetPopularPersonsEvent(page: 1));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
