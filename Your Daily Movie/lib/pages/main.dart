import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_daily_movie/pages/splash_screen.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'home_page.dart';
import 'intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Movie Application",
      theme:ThemeData(primaryColor:COLOR_WHITE,textTheme:width < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,fontFamily:"Nunito"),
      home:Splash(),
    );
  }
}

