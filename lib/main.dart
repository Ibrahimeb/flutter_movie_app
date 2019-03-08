import 'package:flutter/material.dart';
import 'dart:async';

import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/pages/TvShowView.dart';
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

  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movie_app"),
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
          MediaList()
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Box"),
              decoration: BoxDecoration(
                  color: Colors.greenAccent
              ),
            ),
            ListTile(
              title: Text("Peliculas"),
              trailing: Icon(
                  Icons.local_movies,
                color: Colors.white,
              ),
              onTap: (){
                var route = MaterialPageRoute(builder: (context) => MediaList()) ; // this code can be in parameter without var route
                Navigator.push(context,route);
              },
            ),
            ListTile(
              title: Text("Television"),
              trailing: Icon(
                  Icons.live_tv,
                color: Colors.white,
              ),
              onTap: (){
                var route = MaterialPageRoute(builder: (context) => TvShowView()) ; // this code can be in parameter without var route
                Navigator.push(context,route);
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

