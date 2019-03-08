import 'package:flutter/material.dart';
import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/Commons/MediaProvider.dart';
import 'package:movie_app/models/Media.dart';
import 'package:movie_app/pages/Media_list_item.dart';

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

  void loadMovie() async {
    var movie = await MovieProvider().fetchMedia();

    setState(() {
      _listMedia.addAll(movie);
      print("set State movie --> ${movie[0].title}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _listMedia.length,
        itemBuilder: (context, index) {
          print(_listMedia[index].getPosterUrl());
          return MediaListItem(_listMedia[index]);
        },
      ) ,
    );
  }


}
