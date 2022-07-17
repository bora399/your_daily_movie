import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_daily_movie/widgets/film_card.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async' show Future;
import 'package:http/http.dart'as http;
import 'package:tmdb_api/tmdb_api.dart';
import 'package:your_daily_movie/pages/favorite_page.dart';
import 'package:your_daily_movie/widgets/bottom_bar.dart';
import 'package:your_daily_movie/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  List<String> statList;
  bool boolValue;
  List<String> favoriteTitles;
  List<String> favoriteDescriptions;
  List<String> favoriteRatings;

  HomePage({Key key,
  this.statList,this.boolValue,this.favoriteTitles,this.favoriteDescriptions,this.favoriteRatings
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List <String> statList2;
List <String> favoriteTitles2 = [];
List <String> favoriteDescriptions2 = [];
List <String> favoriteRatings2 = [];
List <String> favoriteGenres2 = [];
List<FilmCard> favoriteMovies = [];
List<String> favoriteTitles = [];
List<String> favoriteDescriptions = [];
List<String> favoriteRatings = [];
List<String> favoriteGenres = [];
class _HomePageState extends State<HomePage> {
  String apiKey = "dcd69c6b6c0172ae1cdb7f1ad87d72fc";
  String readAccesKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkY2Q2OWM2YjZjMDE3MmFlMWNkYjdmMWFkODdkNzJmYyIsInN1YiI6IjYyY2FjZmZmNGI5YmFlMGE1MGNhY2E3NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.1aN-qEKLYRXPjTG1-RyOqWVrj2FvyBMS6C_yHDZCW8U";
  List trendingmovies = [];
  List trendingTitles = [];
  TextEditingController editingController = TextEditingController();
  List<String> items = [];



  @override
  void initState(){
    super.initState();
    loadMovies();
    readySharedPreferences();
  }


  loadMovies()async{
  TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey,readAccesKey));
  logConfig:ConfigLogger(
    showLogs:true,
    showErrorLogs:true
  );
  Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
  setState((){
      trendingmovies=trendingresult["results"];
  });
  for(var x in trendingmovies){
    trendingTitles.add(x["title"]);
  }
  }

  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    statList2 = sharedPreferences.getStringList("listKey");
    favoriteTitles2 = sharedPreferences.getStringList("listTitle");
    favoriteDescriptions2 = sharedPreferences.getStringList("listDescription");
    favoriteRatings2 = sharedPreferences.getStringList("listRating");
    favoriteGenres2 = sharedPreferences.getStringList("listGenres");
    setState(() {
      saveData();
    });
  }

  Future<void> saveData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    if(widget.statList != null){
      statList2 = widget.statList;
    }
    if(favoriteTitles==[]){
      if(favoriteTitles2!=[]) {
        favoriteTitles = favoriteTitles2;
      }
    }
    else{
      favoriteTitles = favoriteTitles;
    }
    if(favoriteDescriptions==[]){
      if(favoriteDescriptions2!=[]) {
        favoriteDescriptions = favoriteDescriptions2;
      }
    }
    else{
      favoriteDescriptions = favoriteDescriptions;
    }
    if(favoriteRatings==[]){
      if(favoriteRatings2!=[]) {
        favoriteRatings = favoriteRatings2;
      }
    }
    else{
      favoriteRatings = favoriteRatings;
    }
    if(favoriteGenres==[]){
      if(favoriteGenres2!=[]) {
        favoriteGenres = favoriteGenres2;
      }
    }
    else{
      favoriteGenres = favoriteGenres;
    }
    sharedPreferences.setStringList("listGenres",favoriteGenres2);
    sharedPreferences.setStringList("listDescription",favoriteRatings2);
    sharedPreferences.setStringList("listRating",favoriteDescriptions2);
    sharedPreferences.setStringList("listTitle",favoriteTitles2);
    sharedPreferences.setStringList("listKey",statList2);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 15.0;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    var scaffoldKey = GlobalKey<ScaffoldState>();


    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar:BottomBar(size:size,favMovies:favoriteMovies,title:favoriteTitles,description:favoriteDescriptions,rating:favoriteRatings,genres:favoriteGenres),
        key: scaffoldKey,
        backgroundColor: COLOR_BLUE,
        body:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  addHorizontalSpace(size.width/20.8),
                  addVerticalSpace(size.height/7.2),
                  Column(
                    children: [
                  Padding(
                  padding:EdgeInsets.only(right:size.width/6.9),
                  child:Row(
                    children: [
                      AutoSizeText(
                        'Hello ',
                        style: themeData.textTheme.headline2,
                        maxLines: 2,
                      ),
                      AutoSizeText(
                        ':)',
                        style: themeData.textTheme.headline2,
                        maxLines: 2,
                      ),
                    ],
                  ),
                      ),
                  Padding(
                    padding: EdgeInsets.only(right:size.width/60.9),
                    child: AutoSizeText(
                          'Your Daily Movie',
                          style: themeData.textTheme.headline4,
                          maxLines: 2,
                        ),
                  ),
                    ],
                  ),
                  addHorizontalSpace(size.width/2.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon:Icon(Icons.settings,color:COLOR_WHITE),
                        onPressed:(){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SettingsPage()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              addVerticalSpace(size.height/60),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:size.width/8),
                child: Card(
                  color:COLOR_BLUE,
                  elevation:0,
                  shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                        child: TextField(
                          onChanged:null,//search process will be here.
                          style:themeData.textTheme.headline4,
                          controller: editingController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: COLOR_SEARCH_BLUE,
                            prefixIcon: Icon(Icons.search, color: COLOR_WHITE),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle:themeData.textTheme.headline4,
                            labelStyle: themeData.textTheme.headline4,
                            floatingLabelStyle: themeData.textTheme.headline4,
                          ),
                        ),
                      ),
                    ),
              ),
              addVerticalSpace(size.height/11),
              Padding(
                padding:EdgeInsets.symmetric(horizontal:size.width/12),
                child:AutoSizeText(
                  "Trending Movies",
                  maxLines:1,
                  style:themeData.textTheme.headline6,
                ),
              ),
              Flexible(
                  child:Container(
                    child:Padding(
                      padding:EdgeInsets.symmetric(horizontal:0.0),
                      child:ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:trendingmovies.length!=null?trendingmovies.length:0,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>FilmCard(trending:trendingmovies[index],)));
                            },
                            child:Container(
                              child:Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical:8.0),
                                    child: Container(
                                      width:size.width/2,
                                      height:size.width/2,
                                      decoration:BoxDecoration(
                                        image:DecorationImage(
                                          image:NetworkImage(
                                              "https://image.tmdb.org/t/p/w500"+trendingmovies[index]["backdrop_path"]!=null?"https://image.tmdb.org/t/p/w500"+trendingmovies[index]["poster_path"]:"Loading",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child:Text(trendingmovies[index]["title"]!=null?trendingmovies[index]["title"]:"Loading",style:themeData.textTheme.headline5),
                                  ),
                                  Container(
                                    child:ElevatedButton(
                                      onPressed: (){
                                        if(favoriteTitles.contains(trendingmovies[index]["title"])){
                                          print("It has already added to favorite list");
                                        }
                                        else{
                                          favoriteMovies.add(FilmCard(trending:trendingmovies[index]));
                                          favoriteDescriptions.add(trendingmovies[index]["overview"]);
                                          favoriteRatings.add(trendingmovies[index]["vote_average"].toString().split("")[0]+trendingmovies[index]["vote_average"].toString().split("")[1]+trendingmovies[index]["vote_average"].toString().split("")[2]);
                                          favoriteTitles.add(trendingmovies[index]["title"]);
                                          favoriteGenres.add(trendingmovies[index]["genre_ids"][0].toString());
                                        }
                                      },
                                      child:Text("Add To Favorites",style:themeData.textTheme.headline4),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all<Color>(COLOR_SEARCH_BLUE),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
