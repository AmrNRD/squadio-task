
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';

import 'core/app.localization.dart';
import 'core/routes/route_generator.dart';
import 'core/set_up.dart';
import 'env.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver{

  @override
  void initState() {
    SetUp.initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squadio',
      themeMode: Env.themeMode,
      supportedLocales: const <Locale>[Locale('en', 'US'),Locale('ar','EG')],
      localizationsDelegates: const [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      localeResolutionCallback: (locale, supportedLocales) {
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      locale: Env.locale,
      onGenerateRoute: RouteGenerator().generateRoute,
      initialRoute: Routes.splashPage,
    );
  }




  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
