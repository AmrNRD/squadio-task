import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadio/core/theme/app_colors.dart';

import '../../../core/routes/route_generator.dart';

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
      backgroundColor:Color(0xFF422e87) ,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[100]!,
                highlightColor:AppColors.primaryColor,
                child: SvgPicture.asset(
                  "assets/images/splash_background_pattern.svg",
                  alignment: Alignment.bottomRight,
                ),
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
    String route=Routes.homePage;
    return Timer(const Duration(seconds: 2),()=> navigationPage(route));
  }

  void navigationPage(String route) {
      Navigator.of(context).pushReplacementNamed(route);
  }
}
