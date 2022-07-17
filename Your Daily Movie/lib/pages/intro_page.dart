import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';

class IntroPage extends StatefulWidget {
  bool boolValue;

  IntroPage({
    Key key,
    this.boolValue,
  }) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<String> favoriteTitles = [];
  List<String> favoriteDescriptions = [];
  List<String> favoriteRatings = [];
  List<bool> tapList = [false,false,false,false,false,false,false,false,false];
  List<String> movieTypes = [];
  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      saveData();
    });
  }

  Future<void> saveData() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("seen",true);
    }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                addVerticalSpace(size.height / 29),
                Center(
                    child: Text("Choose Film Genres",
                        style: themeData.textTheme.headline2)),
                addVerticalSpace(size.height / 100),
                Text("Which is best for you?",
                    style: themeData.textTheme.headline4),
              ],
            ),
            addVerticalSpace(size.height / 25),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[0]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap:(){
                              setState((){
                                if(tapList[0] == false){
                                  tapList[0] = true;
                                  if(!movieTypes.contains("Action")){
                                    movieTypes.add("Action");
                                  }
                                }
                                else{
                                  tapList[0] = false;
                                  if(movieTypes.contains("Action")){
                                    movieTypes.remove("Action");
                                  }
                                }
                              });
                            },
                            child: Image.asset("assets/images/red_notice.jpg")
                          ),
                          Text("Action"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[1]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[1] == false){
                                    tapList[1] = true;
                                    if(!movieTypes.contains("Adventure")){
                                      movieTypes.add("Adventure");
                                    }
                                  }
                                  else{
                                    tapList[1] = false;
                                    if(movieTypes.contains("Adventure")){
                                      movieTypes.remove("Adventure");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/adventure.png")
                          ),
                          Text("Adventure"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[2]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[2] == false){
                                    tapList[2] = true;
                                    if(!movieTypes.contains("Documentary")){
                                      movieTypes.add("Documentary");
                                    }
                                  }
                                  else{
                                    tapList[2] = false;
                                    if(movieTypes.contains("Documentary")){
                                      movieTypes.remove("Documentary");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/documentary.png")
                          ),
                          Text("Documentary",style:themeData.textTheme.bodyText2),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(size.height / 25),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[3]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[3] == false){
                                    tapList[3] = true;
                                    if(!movieTypes.contains("Drama")){
                                      movieTypes.add("Drama");
                                    }
                                  }
                                  else{
                                    tapList[3] = false;
                                    if(movieTypes.contains("Drama")){
                                      movieTypes.remove("Drama");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/drama.png")
                          ),
                          Text("Drama"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[4]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[4] == false){
                                    tapList[4] = true;
                                    if(!movieTypes.contains("Historical")){
                                      movieTypes.add("Historical");
                                    }
                                  }
                                  else{
                                    tapList[4] = false;
                                    if(movieTypes.contains("Historical")){
                                      movieTypes.remove("Historical");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/historical.png")
                          ),
                          Text("Historical"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[5]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[5] == false){
                                    tapList[5] = true;
                                    if(!movieTypes.contains("Horror")){
                                      movieTypes.add("Horror");
                                    }
                                  }
                                  else{
                                    tapList[5] = false;
                                    if(movieTypes.contains("Horror")){
                                      movieTypes.remove("Horror");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/horror.png")
                          ),
                          Text("Horror"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(size.height / 25),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[6]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[6] == false){
                                    tapList[6] = true;
                                    if(!movieTypes.contains("Sci-Fi")){
                                      movieTypes.add("Sci-Fi");
                                    }
                                  }
                                  else{
                                    tapList[6] = false;
                                    if(movieTypes.contains("Sci-Fi")){
                                      movieTypes.remove("Sci-Fi");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/scifi.png")
                          ),
                          Text("Sci-Fi"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[7]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[7] == false){
                                    tapList[7] = true;
                                    if(!movieTypes.contains("Romantic")){
                                      movieTypes.add("Romantic");
                                    }
                                  }
                                  else{
                                    tapList[7] = false;
                                    if(movieTypes.contains("Romantic")){
                                      movieTypes.remove("Romantic");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/romantic.png")
                          ),
                          Text("Romantic"),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    width: size.width / 3,
                    child: Card(
                      color:tapList[8]==true?Colors.green:Colors.white,
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                              onTap:(){
                                setState((){
                                  if(tapList[8] == false){
                                    tapList[8] = true;
                                    if(!movieTypes.contains("Thriller")){
                                      movieTypes.add("Thriller");
                                    }
                                  }
                                  else{
                                    tapList[8] = false;
                                    if(movieTypes.contains("Thriller")){
                                      movieTypes.remove("Thriller");
                                    }
                                  }
                                }
                                );
                              },
                              child: Image.asset("assets/images/thriller.png")
                          ),
                          Text("Thriller"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton:movieTypes.length>=3?FloatingActionButton(
          onPressed:(){
            print(movieTypes);
            readySharedPreferences();
            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(statList:movieTypes)));
          },
          child:Icon(Icons.forward,color:COLOR_WHITE),
          backgroundColor: COLOR_SEARCH_BLUE,
      )
          :null,
    );
  }
}

