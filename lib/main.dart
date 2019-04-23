import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:movie_app/Commons/MediaProvider.dart';
import 'package:movie_app/models/Media.dart';
import 'package:movie_app/pages/madia_list.dart';

void main() => runApp(MaterialApp(
    home: MyApp(),
  theme: ThemeData.dark(),
)
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<Media> _listMedia = List();

  var titleAppbar;
  var titleNavBotton;
  var currentIndex=0;
  var isMovie=true;

//  int i = 0;
//  var pages = [
//     HomePage(),
//     BlogPage(),
//     LibraryPage(),
//     NotificationsPage()
//  ];


  @override
  void initState() {
    super.initState();
    loadMovie(MediaTypeQuery.TAB_POPULAR);
    titleAppbar = "movie";
    titleNavBotton = "Proximamente";
  }

  void loadMovie(MediaTypeQuery query) async {
    var movie = await MovieProvider().fetchMediaPopular(query);
    setState(() {
      titleAppbar = "movie";
      titleNavBotton = "Proximamente";
      isMovie = true;

      if (_listMedia.length>0)
        _listMedia.clear();

      _listMedia.addAll(movie);

    });
  }


  void loadTvShow(MediaTypeQuery query) async {
    var movie = await ShowProvider().fetchMediaPopular(query);
    setState(() {
      titleAppbar = "tv Show";
      titleNavBotton = "en el aire";
      isMovie = false;

      if (_listMedia.length>0)
        _listMedia.clear();

      _listMedia.addAll(movie);

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleAppbar),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,color: Colors.white,),
              onPressed: (){

              }
              )
        ],
      ),
      body: PageView(
        children: <Widget>[
          MediaList(_listMedia)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    FadeInImage.assetNetwork(
                      placeholder: "images/placeholder.jpg",
                      image: _putImageHeader(),
                      fit: BoxFit.fitWidth,
                      fadeInDuration: Duration(microseconds: 40),
                      width: double.maxFinite,
                      height: 200,
                    ),
                  ],
                ),
              )
            ),
            ListTile(
              title: Text("Peliculas"),
              trailing: Icon(
                  Icons.local_movies,
                color: Colors.white,
              ),
              onTap: (){
               setState(() {
                 loadMovie(MediaTypeQuery.TAB_POPULAR);
               });
               Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Television"),
              trailing: Icon(
                  Icons.live_tv,
                color: Colors.white,
              ),
              onTap: (){
                setState(() {
                  loadTvShow(MediaTypeQuery.TAB_POPULAR);

                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Cerrar"),
              trailing: Icon(
                  Icons.close,
                color: Colors.white,
              ),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
        currentIndex: currentIndex,
        onTap: (index){
          currentIndex = index;

          switch (currentIndex) {
            case 0:
              setState(() {
                _onEventNavButton(index, MediaTypeQuery.TAB_POPULAR);

              });
              break;
            case 1:
              setState(() {
                _onEventNavButton(index, MediaTypeQuery.TAB_UPCOMING);
              });
              break;
            case 2:
              setState(() {
                _onEventNavButton(index, MediaTypeQuery.TAB_TOPRATE);
              });
              break;
          }
        },
      ),
    );
  }


  _onEventNavButton(int index,MediaTypeQuery type){

    if (isMovie)
      loadMovie(type);
    else{
      if (index==1)
        loadTvShow(MediaTypeQuery.TAB_ON_AIR);
        else
      loadTvShow(type);
    }

  }

   _getFooterItems() => [
     BottomNavigationBarItem(icon: Icon(Icons.thumb_up),title: Text("Mas populares")),
     BottomNavigationBarItem(icon: Icon(Icons.update), title: Text(titleNavBotton)),
     BottomNavigationBarItem(icon: Icon(Icons.star),title: Text("Mejor valoradas"))
   ];

   String _putImageHeader() {

     var rng = Random();

     if (_listMedia.length>0){
       return _listMedia[rng.nextInt(_listMedia.length)].getBackDropUrl();
     }else
       return "";
   }






}

