import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/widgets/film_card.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/widgets/bottom_bar.dart';

class FavoritePage extends StatelessWidget {
  List<FilmCard> filmList;
  List<String> title;
  List<String> description;
  List<String> rating;

  FavoritePage({Key key,
  @required this.filmList,@required this.title, @required this.description, @required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child:Scaffold(
        bottomNavigationBar:BottomBar(size:size,favMovies:favoriteMovies,title:favoriteTitles,description:favoriteDescriptions,rating:favoriteRatings,genres:favoriteGenres),
        key:scaffoldKey,
        backgroundColor: COLOR_BLUE,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.symmetric(horizontal:0.0,vertical:0.0),
              child:IconButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                icon:Icon(Icons.arrow_back_outlined,color:COLOR_WHITE,size:32),
              )
            ),
            Flexible(
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal:0.0,vertical: 0.0),
                child:ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount:title.length,
                  itemBuilder:(BuildContext context, int index){
                    return Card(
                      color: COLOR_SEARCH_BLUE,
                        child: ListTile(
                          title:Text(title[index]!=null?title[index]:"Loading",style:themeData.textTheme.subtitle1),
                          subtitle:Text(description[index]!=null?description[index]:"Loading",style:themeData.textTheme.subtitle2),
                      ),
                    );
                  }
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
