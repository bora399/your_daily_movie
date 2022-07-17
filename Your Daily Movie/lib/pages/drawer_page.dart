import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:your_daily_movie/pages/home_page.dart';

//IT'S NOT USING ANYMORE!
//IT'S NOT USING ANYMORE!
//IT'S NOT USING ANYMORE!
//IT'S NOT USING ANYMORE!
//IT'S NOT USING ANYMORE!

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        padding:EdgeInsets.zero,
        children:<Widget>[
          DrawerHeader(
            key:key,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText("Welcome To",textStyle:TextStyle(fontWeight:FontWeight.w700)),
                    ScaleAnimatedText("Your Favorite",textStyle:TextStyle(fontWeight:FontWeight.w700)),
                    ScaleAnimatedText("Movie App!",textStyle:TextStyle(fontWeight:FontWeight.w700)),
                  ],
                  isRepeatingAnimation: false,
            ),
              ],
            ),
          ),
          ListTile(
            leading:Icon(Icons.favorite),
            title:Text("Your Favorite Movies <3"),
            onTap:(){
              //Navigator.push(context,MaterialPageRoute(builder:(context)=>FavoritePage()));
            },
          ),
          ListTile(
            leading:Icon(Icons.movie),
            title:Text("Suggest Movie For Me"),
            onTap:(){
              print(statList2);
              //Navigator.push(context,MaterialPageRoute(builder: (context) => SuggestPage()));
              //showAlertDialog(context);
            },
          ),
          ListTile(
            leading:Icon(Icons.query_stats),
            title:Text("Your Movie Stats"),
            onTap:(){
              //Navigator.push(context,MaterialPageRoute(builder:(context)=>StatsPage()));
            },
          ),
        ],
      ),
    );
  }
}
