
import 'package:flutter/foundation.dart' show FlutterError, defaultTargetPlatform, kDebugMode;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../env.dart';


class SetUp{

  static Future<void> initApp() async{
    //Admob initialize
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