import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:your_daily_movie/widgets/bottom_bar.dart';

class StatsPage extends StatelessWidget {
  List<String> genreList;

  StatsPage({Key key,
  this.genreList,
  }) : super(key: key);


  Map mapGenres = {
     "28":"Action",
     "12":"Adventure",
     "16":"Animation",
     "35":"Comedy",
     "80":"Crime",
     "99":"Documentary",
     "18":"Drama",
     "10751":"Family",
     "14":"Fantasy",
     "36":"History",
     "27":"Horror",
     "10402":"Music",
     "9648":"Mystery",
     "10749":"Romance",
     "878":"Science Fiction",
     "10770":"TV Movie",
     "53":"Thriller",
     "10752":"War",
     "37":"Western",
  };

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    return SafeArea(
      child:Scaffold(
        bottomNavigationBar:BottomBar(size:size,favMovies:favoriteMovies,title:favoriteTitles,description:favoriteDescriptions,rating:favoriteRatings,genres:favoriteGenres),
        backgroundColor: COLOR_BLUE,
        body:Column(
          children: [
            Row(
              children: [
                Align(
                  alignment:Alignment.topLeft,
                  child:IconButton(
                    onPressed:(){
                      Navigator.pop(context);
                    },
                    icon:Icon(Icons.arrow_back,color:COLOR_WHITE,size:35),
                  ),
                ),
                Flexible(child:Align(
                  alignment:Alignment.topCenter,
                  child:Text("Your Favorite Genres According To Favs",style:themeData.textTheme.headline4),
                ),
      ),
              ],
            ),
            addVerticalSpace(size.height/30),
            Flexible(
              child: ListView.builder(
                itemCount:genreList.length,
                itemBuilder:(BuildContext context, int index){
                  return Card(
                    color:COLOR_SEARCH_BLUE,
                    child:ListTile(
                      leading:Icon(Icons.movie_creation_outlined,color:COLOR_WHITE),
                      title:Text(mapGenres[genreList[index]],style:themeData.textTheme.headline2),
                      trailing:Icon(Icons.movie_creation_outlined,color:COLOR_WHITE)
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
