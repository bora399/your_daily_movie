import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_daily_movie/pages/home_page.dart';
import 'package:your_daily_movie/utils/constants.dart';
import 'package:your_daily_movie/utils/widget_functions.dart';
import 'package:your_daily_movie/widgets/bottom_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child:Scaffold(
        backgroundColor: COLOR_BLUE,
        bottomNavigationBar:BottomBar(size:size,favMovies:favoriteMovies,title:favoriteTitles,description:favoriteDescriptions,rating:favoriteRatings,genres:favoriteGenres),
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment:Alignment.topLeft,
              child: IconButton(
                onPressed:(){
                  Navigator.pop(context);
                },
                icon:Icon(Icons.arrow_back,color:COLOR_WHITE,size:34),
              ),
            ),
            addVerticalSpace(size.height/2.7),
            Center(child:Text("Settings Page",style:themeData.textTheme.headline2)),
          ],
        ),
      ),
    );
  }
}
