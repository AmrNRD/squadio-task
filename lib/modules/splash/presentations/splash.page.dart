import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:squadio/core/theme/app_colors.dart';
import 'package:squadio/core/utils/app_exceptions.dart';
import 'package:squadio/core/utils/core.util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/routes/route_generator.dart';
import '../../../env.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    startSplashTimer();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor:AppColors.accentColor,
              child: SvgPicture.asset(
                "assets/images/splash_background_pattern.svg",
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
          Align(
            child: Hero(
              tag: "Logo",
              child: SvgPicture.asset("assets/images/logo_with_name.svg"),
            ),
          ),
        ],
      ),
    );
  }

  late int? boardingScreen;
  Future startSplashTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String route=Routes.homePage;
    return Timer(const Duration(seconds: 1),()=> navigationPage(route));
  }

  void navigationPage(String route) {
      Navigator.of(context).pushReplacementNamed(route);
  }
}
