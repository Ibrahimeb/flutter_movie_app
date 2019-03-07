import 'package:flutter/material.dart';

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
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: _getFooterItems(),),
    );
  }

   _getFooterItems() => [
     BottomNavigationBarItem(icon: Icon(Icons.thumb_up),title: Text("Mas populares")),
     BottomNavigationBarItem(icon: Icon(Icons.update), title: Text("Proximamente")),
     BottomNavigationBarItem(icon: Icon(Icons.star),title: Text("Mejor valoradas"))

   ];






}

