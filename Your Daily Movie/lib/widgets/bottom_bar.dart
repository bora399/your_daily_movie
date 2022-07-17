import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/pages/fav_genres.dart';
import 'package:your_daily_movie/pages/favorite_page.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/pages/stats_page.dart';
import 'package:your_daily_movie/widgets/film_card.dart';
import 'package:your_daily_movie/utils/constants.dart';

class BottomBar extends StatelessWidget {
  BottomBar({this.size,this.favMovies,this.title,this.description,this.rating,this.genres});
  List<FilmCard> favMovies;
  final Size size;
  List<String> title;
  List<String> description;
  List<String> rating;
  List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context) => FavoritePage(filmList: favMovies,title:title,description: description,rating:rating)));
              },
              icon: Icon(Icons.favorite,size:size.width/11,color:COLOR_WHITE)),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child:IconButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context) => FavoriteGenres(statList: statList2)));
              },
              icon: Icon(Icons.movie,size:size.width/11,color:COLOR_WHITE)),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: IconButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(context) => StatsPage(genreList: genres)));
              },
              icon: Icon(Icons.query_stats,size:size.width/11,color:COLOR_WHITE)),
        ),

      ],
    );

  }
}
