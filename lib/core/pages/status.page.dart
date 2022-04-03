import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:squadio/core/common/generic_state.dart';
import 'package:squadio/core/routes/route_generator.dart';

class StatusPage extends StatefulWidget {
  final dynamic data;
  const StatusPage({Key? key, this.data}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  String? routeBack;
  late String buttonText;
  late String description;
  late String iconPath;

  bool _goBack=false;
  @override
  void initState() {
    super.initState();
    if(widget.data!=null&&widget.data is Map){
      if((widget.data as Map).containsKey("goBack")){
        _goBack=true;
      }
      if((widget.data as Map).containsKey("routeBack")){
        routeBack=widget.data['routeBack'].toString();
      }else{
        routeBack=Routes.homePage;
      }
      if((widget.data as Map).containsKey("buttonText")){
        buttonText=widget.data['buttonText'].toString();
      }else{
        buttonText="home";
      }

      if((widget.data as Map).containsKey("iconPath")){
        iconPath=widget.data['iconPath'].toString();
      }else{
        iconPath="assets/icons/program_selected.svg";
      }
      if((widget.data as Map).containsKey("description")){
        description=widget.data['description'].toString();
      }else{
        description="Ou-oh";
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          actions: [
            InkWell(
              onTap: ()=>goToPage(context),
              child: Container(
                  margin: const EdgeInsets.all(20),
                  child: const Icon(FontAwesomeIcons.times)
              ),
            )
          ],
          elevation: 0,
          leading: Container(),
        ),
        body: Container(
            margin: const EdgeInsets.all(16),
            child: GenericState(imagePath:iconPath , title: description, body: "",buttonText: buttonText,onPress:()=> goToPage(context),showButton: true)
        )
    );
  }

  void goToPage(BuildContext context) {
    if(_goBack&&routeBack!=null){
      Navigator.of(context).popUntil(ModalRoute.withName(routeBack!));
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(Routes.homePage, (route)=>false);
    }
  }
}
