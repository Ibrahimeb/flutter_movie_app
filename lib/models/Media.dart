
import 'package:movie_app/Commons/Utils.dart';

class Media {

  String poster_path;
  String overview;
  String release_date;
  List<dynamic> genre_ids;
  int id;
  String title;
  String backdrop_path;
  double vote_average;


  getPosterUrl() => getMediumPictureUrl(poster_path);

  factory Media(Map map){
    try{
      return Media.fromJsonMap(map);
    }catch(ex){
      throw ex;
    }
  }

  Media.fromJsonMap(Map map):
    poster_path = map["poster_path"]??"",
    overview = map["overview"],
    release_date = map["release_date"],
    genre_ids = map["genre_ids"].toList(),
    id = map["id"],
    title = map["title"],
    backdrop_path = map["backdrop_path"]??"",
    vote_average = map["vote_average"].toDouble();

}
