import 'package:flutter/material.dart';
import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/models/Media.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _listMedia = List();

  @override
  void initState() {
    super.initState();
    loadMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _listMedia.length,
        itemBuilder: (context, index) {
          Column(
            children: <Widget>[Image.network(_listMedia[index].getPosterUrl())],
          );
        },
      ),
    );
  }

  void loadMovie() async {
    var movie = await HttpHandler().fetchMovie();
    
    setState(() {
      _listMedia.addAll(movie);
      print("set State movie --> ${movie[0].title}");
    });
  }
}
