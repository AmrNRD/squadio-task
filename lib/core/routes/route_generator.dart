
import 'package:flutter/material.dart';
import 'package:squadio/core/common/appbar.dart';
import 'package:squadio/core/common/generic_state.dart';
import 'package:squadio/core/pages/status.page.dart';
import 'package:squadio/core/utils/core.util.dart';
import 'package:squadio/modules/home/presentations/home.page.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/presentations/person_details.page.dart';
import 'package:squadio/modules/splash/presentations/splash.page.dart';


class Routes {

  //<editor-fold desc="Initial Routes" defaultstate="collapsed">
  static const String splashPage = '/';
  static const String welcomePage = '/welcome';
  //</editor-fold>

  //<editor-fold desc="Home Routes" defaultstate="collapsed">
  static const String homePage = '/home';
  static const String calendarViewsPage = '/calendar-views';
  static const String calendarTab = '/calendar-tab';
  //</editor-fold>

  //<editor-fold desc="Person Routes" defaultstate="collapsed">
  static const String personDetailsPage = '/person-details';
  //</editor-fold>

  // <editor-fold desc="Extra Routes" defaultstate="collapsed">
  static const String statusPage = '/status';
  //</editor-fold>


}

class RouteGenerator {
  Map extraVariables;

  RouteGenerator({this.extraVariables=const {}});

  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;


    switch (settings.name) {
    //<editor-fold desc="Initial Routes" defaultstate="collapsed">
      case Routes.splashPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.splashPage),
          builder: (_) => SplashPage(),
        );
      // case Routes.welcomePage:
      //   return MaterialPageRoute(
      //     settings: const RouteSettings(name: Routes.welcomePage),
      //     builder: (_) => WelcomePage(),
      //   );

    //</editor-fold>

    //<editor-fold desc="Home Routes" defaultstate="collapsed">
      case Routes.homePage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.homePage),
          builder: (_) => HomePage(),
        );
    //</editor-fold>

    //<editor-fold desc="Person Routes" defaultstate="collapsed">
      case Routes.personDetailsPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.personDetailsPage),
          builder: (_) => PersonDetailsPage(person: args as Person),
        );
    //</editor-fold>

      case Routes.statusPage:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.statusPage),
          builder: (_) => StatusPage(data: args),
        );


      default:
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: const MettleAppBar(title: "Error"),
        body: GenericState(
            imagePath: "assets/icons/error.svg",
            title: "Error has happened",
            body: "",
            buttonText: "Go Back",
            showButton: true,
            onPress: ()=>
            Navigator.of(context).canPop()?Navigator.of(context).pop():
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.homePage, (route)=>false)
        ),
      );
    });
  }
}
