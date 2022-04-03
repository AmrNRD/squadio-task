
// import 'package:facebook_app_events/facebook_app_events.dart';
import 'dart:io';
import 'package:flutter/material.dart';

enum devMode { development, production }

// ignore: avoid_classes_with_only_static_members
class Env {
  //please Set API Base Route
  static const String _localUrl = 'https://api.themoviedb.org';
  static const String _productionUrl = 'https://api.themoviedb.org';
  static devMode mode = devMode.production;

  //Current API Version
  static String? apiVersion = '3';


  //themoviedb.org API token
  static const String token="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";



  //Current App ThemeMode
  static ThemeMode? themeMode=ThemeMode.system;

  //Locale
  static Locale locale=const Locale('en', 'US');


  //API URL
  static String get baseUrl {
    if (mode == devMode.development) {
      return "$_localUrl/$apiVersion";
    } else {
      return "$_productionUrl/$apiVersion";
    }
  }

  //Current Local Database
  static int? databaseVersion=1;




}
