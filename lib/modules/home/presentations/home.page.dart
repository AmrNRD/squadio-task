import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:squadio/core/common/footer_widget.dart';
import 'package:squadio/core/common/generic_state.dart';
import 'package:squadio/modules/person/bloc/person/person_bloc.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_online_data_repository.dart';
import 'package:squadio/modules/person/widgets/person.card.dart';
import 'package:squadio/modules/person/widgets/person_shimmer.card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersonBloc _personBloc;

  final RefreshController _refreshController = RefreshController();

  List<Person> _popularPersons=[];

  int _currentPage=1;
  int _totalPage=1;

  int _status=1;

  String? _errorMessage;

  @override
  void initState() {
    _personBloc=PersonBloc(PersonOnlineDataRepository());
    _personBloc.add(GetPopularPersonsEvent(page: 1));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider<PersonBloc>(
            create: (context)=>_personBloc,
            child: BlocListener<PersonBloc,PersonState>(
              listener: (context,state){
                if(state is PersonLoadingState){
                  setState(() {
                    _status=1;
                  });
                }else if(state is PersonsLoadedState){
                  setState(() {
                    _currentPage=state.page;
                    _totalPage=state.totalNumberOfPage;

                  });
                  if(_currentPage==1){
                    setState(() {
                      _status=2;
                      _popularPersons=state.persons;
                      _refreshController.refreshCompleted();
                    });
                  }else if(_currentPage!=_totalPage){
                    setState(() {
                      _status=2;
                      _popularPersons.addAll(state.persons);
                      _refreshController.loadComplete();
                    });
                  }
                }else if(state is PersonErrorState){
                  setState(() {
                    _status=3;
                    _errorMessage=state.message;
                  });
                }
              },
              child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  footer:const NewFooter(),
                  header: const WaterDropHeader(),
                  controller: _refreshController,
                  onRefresh: _onRefresh,
                  onLoading: _onLoading,
                  physics:const BouncingScrollPhysics(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if(_popularPersons.isNotEmpty)
                        ListView.builder(
                            shrinkWrap: true,
                            primary: true,
                            physics:const BouncingScrollPhysics(),
                            itemCount: _popularPersons.length,
                            itemBuilder: (context,index){
                              return PersonCard(person: _popularPersons[index]);
                            }
                        ),

                        if(_status==1)
                          ListView.builder(
                              shrinkWrap: true,
                              primary: true,
                              physics:const BouncingScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context,index){
                                return PersonShimmerCard();
                              }
                          )
                        else if(_status==3&&_errorMessage!=null)
                          GenericState(imagePath: "assets/icons/warning.svg", title: "Error happened", body: _errorMessage!),

                      ],
                    ),
                  )
              ),
            ),
          )
      ),
    );
  }


  //<editor-fold desc="Pagination Action (on Refresh, on Loading)" defaultstate="collapsed">
  void _onRefresh(){
    setState(() {
      _currentPage=1;
    });
    _personBloc.add(GetPopularPersonsEvent(page: _currentPage));
  }

  void _onLoading(){
    if(_currentPage!=_totalPage){
      setState(() {
        _currentPage++;
      });
      _personBloc.add(GetPopularPersonsEvent(page: _currentPage));
    }
  }
//</editor-fold>

@override
  void dispose() {
    _personBloc.close();
    _refreshController.dispose();
    super.dispose();
  }
}
