import 'package:flutter/material.dart';
import 'package:movie_app/models/Media.dart';

class MediaListItem extends StatelessWidget {
  final Media _item;

  MediaListItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
              child: Stack(children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: "images/placeholder.jpg",
              image: _item.getBackDropUrl(),
              fit: BoxFit.cover,
              fadeInDuration: Duration(microseconds: 40),
              width: double.infinity,
              height: 200,
            ),
            Positioned(
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900].withOpacity(0.5),
                  ),
                  constraints: BoxConstraints.expand(height: 65),
                )),
            Positioned(
                left: 10,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    _item.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  width: 250,
                  margin: EdgeInsets.only(top: 5),
                  child:  Text(
                    _item.getGenres(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )),
            Positioned(
              right: 5,
            bottom: 5,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(_item.vote_average.toString()),
                      Container(width: 4,),
                      Icon(Icons.star,color: Colors.white,size: 20,)
                    ],
                  ),
                  Container(height: 4,),
                  Row(
                    children: <Widget>[
                      Text(_item.getYear().toString()),
                      Container(width: 4,),
                      Icon(Icons.calendar_today,color: Colors.white,size: 20,)
                  ],
                  )
                ],
              ),
            ),
                )
          ]))
        ],
      ),
    );
  }
}
