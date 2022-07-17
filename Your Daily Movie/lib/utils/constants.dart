import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const BACKGROUND_WHITE = Color.fromRGBO(240, 233, 233,1);
const COLOR_WHITE = Color.fromRGBO(223, 223, 232,1);
const COLOR_RED = Color.fromRGBO(153, 11, 11,1);
const COLOR_BLACK = Colors.black;
const COLOR_GREY = Color.fromRGBO(53, 56, 54,1);
const COLOR_BLUE = Color.fromRGBO(9, 9, 66,1);
const COLOR_SEARCH_BLUE = Color.fromRGBO(24, 24, 97,1);

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
  headline1:TextStyle(
      color:COLOR_BLACK,fontWeight:FontWeight.w700, fontSize:28
  ),
  headline2:TextStyle(
      color:COLOR_WHITE,fontWeight:FontWeight.w800, fontSize:24
  ),
  headline3:TextStyle(
      color:COLOR_BLACK,fontWeight:FontWeight.w600, fontSize:20,decoration:TextDecoration.underline,
  ),
  headline4:TextStyle(
    color:COLOR_WHITE,fontWeight:FontWeight.w600,fontSize:18,
  ),
  headline5:TextStyle(
    color:COLOR_WHITE,fontWeight:FontWeight.w600,fontSize:12,
  ),
  headline6:TextStyle(
    color:COLOR_WHITE,fontWeight:FontWeight.w600,fontSize:20,
  ),
  bodyText1:TextStyle(
      color:COLOR_BLACK,fontSize:18,fontWeight:FontWeight.w500,
  ),
  bodyText2:TextStyle(
      color:COLOR_BLACK,fontSize:14,fontWeight:FontWeight.w500,height:1.5
  ),
  subtitle1:TextStyle(
    color:COLOR_WHITE,fontWeight:FontWeight.w600,fontSize:22,
  ),
  subtitle2: TextStyle(
      color:COLOR_WHITE,fontWeight:FontWeight.w600,fontSize:14,
  ),
);

const TextTheme TEXT_THEME_SMALL = TextTheme(
  headline1:TextStyle(
      color:COLOR_BLACK,fontWeight:FontWeight.w700, fontSize:22
  ),
  headline2:TextStyle(
      color:COLOR_BLACK,fontWeight:FontWeight.w700, fontSize:18
  ),
  headline3:TextStyle(
      color:COLOR_BLACK,fontWeight:FontWeight.w700, fontSize:16
  ),
  bodyText1:TextStyle(
      color:COLOR_BLACK,fontSize:10,fontWeight:FontWeight.w500,height:1.5
  ),
  bodyText2:TextStyle(
      color:COLOR_GREY,fontSize:8,fontWeight:FontWeight.w500,height:1.5
  ),
  subtitle1:TextStyle(
      color:COLOR_BLACK,fontSize:8,fontWeight:FontWeight.w400
  ),
);