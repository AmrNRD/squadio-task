import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio/core/app.localization.dart';
import 'package:squadio/core/common/image.inspector.page.dart';
import 'package:squadio/modules/person/bloc/person/person_bloc.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/person_photo_entity.dart';
import 'package:squadio/modules/person/repositories/person/person_online_data_repository.dart';
import 'package:squadio/modules/person/widgets/details_sliver_delegate.dart';

class PersonDetailsPage extends StatefulWidget {
  final Person person;
  const PersonDetailsPage({Key? key,required this.person}) : super(key: key);
  @override
  _PersonDetailsPageState createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  late PersonBloc _personBloc;

  int _status=0;

  late Person _person;

  List<PersonPhoto> _personPhotos=[];

  @override
  void initState() {
    _person=widget.person;
    _personBloc=PersonBloc(PersonOnlineDataRepository());
    _personBloc.add(GetPersonDetailsEvent(_person.id));
    _personBloc.add(GetPersonPhotosEvent(_person.id));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BlocProvider<PersonBloc>(
          create: (context)=>_personBloc,
          child: BlocListener<PersonBloc,PersonState>(
            listener: (context,state){
              if(state is PersonLoadingState){
                setState(() {
                  _status=1;
                });
              }else if(state is PersonLoadedState){
                setState(() {
                  _status=2;
                  _person=state.person;
                });
              }else if(state is PersonPhotosLoadedState){
                setState(() {
                  _personPhotos=state.personPhotos;
                });
              }
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: DetailsSliverDelegate(
                    expandedHeight: 150,
                    person:_person,
                  ),
                ),
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(_person.knownForDepartment!=null)
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                AppLocalizations.of(context)!.translate("knowingFor",replacement: _person.knownForDepartment!),
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.grey),
                              ),
                            ),
                          if(_person.biography!=null)
                          Text(
                            _person.biography!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),

                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _personPhotos.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:.8,
                              mainAxisSpacing: 10
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: ()=>_pushImageInspector(index),
                                child: CachedNetworkImage(
                                  imageUrl: "https://image.tmdb.org/t/p/w300"+(_personPhotos[index].filePath??""),
                                ),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void _pushImageInspector(int index) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        pageBuilder: (_, __, ___) => ImageViewInspector(
          files: _personPhotos.map((image) => "https://image.tmdb.org/t/p/w300"+(image.filePath??"")).toList(),
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _personBloc.close();
    super.dispose();
  }
}


