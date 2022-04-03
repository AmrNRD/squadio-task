
import 'package:flutter/foundation.dart' show FlutterError, defaultTargetPlatform, kDebugMode;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadio/modules/person/entities/movie_entity.dart';
import 'package:squadio/modules/person/entities/person_entity.dart';
import 'package:squadio/modules/person/entities/tv_series_entity.dart';

import '../env.dart';


class SetUp{

  static Future<void> initApp() async{
    await Hive.initFlutter();
    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(TvSeriesAdapter());
    Hive.registerAdapter(PersonAdapter());
  }

  static Future<ThemeMode> getTheme() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("theme")) {
      final String theme = sharedPreferences.getString("theme")!;
      switch (theme) {
        case "Light":
          return ThemeMode.light;
        case "Dark":
          return ThemeMode.dark;
        case "System":
          return ThemeMode.system;
      }
    }
    return ThemeMode.system;
  }



}