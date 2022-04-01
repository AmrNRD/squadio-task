import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text.styles.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme{

  static final ThemeData lightModeTheme=ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColorDark,
    textTheme: AppTheme.lightTextTheme,
    fontFamily: "Poppins",
    backgroundColor:AppColors.backgroundColor,
    primaryColorDark: AppColors.primaryColorDark,
    cardColor: Colors.white,
    canvasColor:AppColors.backgroundColor,
    disabledColor: AppColors.grey,
    hintColor: AppColors.lightGrey,
    brightness: Brightness.light,
    bottomAppBarColor: AppColors.white,
    dialogBackgroundColor: AppColors.backgroundColor,
    dividerColor:AppColors.backgroundColor,
    cupertinoOverrideTheme: const CupertinoThemeData(primaryColor: AppColors.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(10),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
      errorStyle: lightTextTheme.subtitle2!.copyWith(color: Colors.red),
    ),
  );

  static const TextTheme lightTextTheme = TextTheme(
    headline1: headline1,
    headline2: headline2,
    headline3: headline3,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    button: button,
    caption: caption,
    bodyText1: bodyText1,
    bodyText2: bodyText2,
    subtitle1: input,
    subtitle2: subtitle2,

  );
}