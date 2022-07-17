import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:your_daily_movie/widgets/bottom_bar.dart';

class FavoriteGenres extends StatelessWidget {
  List<String> statList;

  FavoriteGenres({Key key,
  @required this.statList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child:Scaffold(
        backgroundColor: COLOR_BLUE,
        bottomNavigationBar:BottomBar(size:size,favMovies:favoriteMovies,title:favoriteTitles,description:favoriteDescriptions,rating:favoriteRatings,genres:favoriteGenres),
        body:Column(
          children:[
            addVerticalSpace(size.height/100),
            Row(
              children: [
                IconButton(
                  onPressed:(){
                    Navigator.pop(context);
                  },
                  icon:Icon(Icons.arrow_back,size:32,color:COLOR_WHITE),
                ),
                addHorizontalSpace(size.width/12),
                Center(
                  child:Text("Your Favorite Genres!",style:themeData.textTheme.headline2),
                ),
              ],
            ),
            addVerticalSpace(size.height/30),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount:statList.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  color:COLOR_SEARCH_BLUE,
                  child:ListTile(
                    leading:Icon(Icons.movie_creation_outlined),
                    title:Text(statList[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
