import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FilmCard extends StatefulWidget {
  Map trending;

  FilmCard({Key key,
  this.trending,
  }) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  List<FilmCard> favoriteMovies = [];
  bool favoriteBool = false;

  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      saveData();
    });
  }

  Future<void> saveData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState(){
    super.initState();
    readySharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    final ThemeData themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        key:scaffoldKey,
        backgroundColor: COLOR_BLUE,
        body:Column(
          children: [
            addVerticalSpace(size.width/8),
            Center(
              child: Container(
                    height:size.height/2,
                    child: Image.network("https://image.tmdb.org/t/p/w500"+widget.trending["poster_path"]!=null?"https://image.tmdb.org/t/p/w500"+widget.trending["poster_path"]:"Loading"),
                ),
            ),
            Center(
              child:Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: AutoSizeText(
                  widget.trending["title"]!=null?widget.trending["title"]:"Loading",style:themeData.textTheme.subtitle1,
                  maxLines:1,
                  maxFontSize:23,
                  minFontSize:18,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding:EdgeInsets.all(15.0),
                child:Container(
                  child:AutoSizeText(
                    widget.trending["overview"]!=null?widget.trending["overview"]:"Loading",style:themeData.textTheme.subtitle2,
                    maxLines: 8,
                    maxFontSize: 15,
                    minFontSize: 10,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:size.height/30,horizontal:size.width/35),
                      child: Container(
                        child:Icon(Icons.star,size:size.width/11,color:COLOR_WHITE),
                      ),
                    ),
                    Text(widget.trending["vote_average"].toString()!=null?widget.trending["vote_average"].toString().split("")[0]+widget.trending["vote_average"].toString().split("")[1]+widget.trending["vote_average"].toString().split("")[2]:"Loading",style:themeData.textTheme.subtitle2),
                  ],
                ),
                Row(
                  children:[
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal:10,vertical:size.height/40),
                      child:ElevatedButton(
                          onPressed:(){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(COLOR_SEARCH_BLUE),
                          ),
                          child: Text("Add To Favorites",style:themeData.textTheme.headline4)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
