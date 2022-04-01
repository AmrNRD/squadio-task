import 'package:flutter/material.dart';

ScaffoldFeatureController showScaffoldSnackBar({required BuildContext context,required String message,int duration=2,Color color=Colors.white,Color backgroundColor=Colors.green}){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.fixed,
      duration: Duration(seconds: duration),
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: Theme.of(context).textTheme.headline4?.copyWith(color: color),
      ),
    ),
  );
}