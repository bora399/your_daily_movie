import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/pages/intro_page.dart';


class Splash extends StatefulWidget {
  @override
  SplashState createState() =>  SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen'));
    if(_seen==true) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder:(context) => HomePage(boolValue:_seen))
      );
    }
    else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child:  Text('Loading...'),
      ),
    );
  }
}