import 'package:flutter/material.dart';
import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/Commons/MediaProvider.dart';
import 'package:movie_app/models/Media.dart';
import 'package:movie_app/pages/Media_list_item.dart';

class MediaList extends StatefulWidget {
  List<Media> _listMedia = List();


  MediaList(this._listMedia);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget._listMedia.length,
        itemBuilder: (context, index) {
          print(widget._listMedia[index].getPosterUrl());
          return MediaListItem(widget._listMedia[index]);
        },
      ) ,
    );
  }


}
