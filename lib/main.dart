import 'package:flutter/material.dart';
import 'dart:async';

import 'package:movie_app/Commons/HttpHandler.dart';
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

class _MyAppState extends State<MyApp> {
  List<Media> _listMedia = List();
  var title;

  @override
  void initState() {
    super.initState();
    loadMovie();
    title = "movie";
  }

  void loadMovie() async {
    var movie = await MovieProvider().fetchMedia();

    setState(() {
      title = "movie";
      if (_listMedia.length>0)
        _listMedia.clear();

      _listMedia.addAll(movie);

    });
  }


  void loadTvShow() async {
    var movie = await ShowProvider().fetchMedia();


    setState(() {
      title = "tv Show";
      if (_listMedia.length>0)
        _listMedia.clear();

      _listMedia.addAll(movie);

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
//                    FadeInImage.assetNetwork(
//                      placeholder: "assets/placeholder.jpg",
//                      image: _listMedia[6].getBackDropUrl(),
//                      fit: BoxFit.cover,
//                      fadeInDuration: Duration(microseconds: 40),
//                      width: double.infinity,
//                      height: 200,
//                    ),
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
                 loadMovie();
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
                  loadTvShow();
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
      bottomNavigationBar: BottomNavigationBar(items: _getFooterItems(),),
    );
  }

   _getFooterItems() => [
     BottomNavigationBarItem(icon: Icon(Icons.thumb_up),title: Text("Mas populares")),
     BottomNavigationBarItem(icon: Icon(Icons.update), title: Text("Proximamente")),
     BottomNavigationBarItem(icon: Icon(Icons.star),title: Text("Mejor valoradas"))

   ];






}

