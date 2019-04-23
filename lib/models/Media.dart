
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
  getBackDropUrl() => getLargePictureUrl(backdrop_path);
  getGenres() => getGenreValues(genre_ids);

  getYear() => release_date == null || release_date == ""?
      0 : DateTime.parse(release_date).year;


  factory Media(Map<String,dynamic> map,MediaType type){
    try{
      return Media.fromJsonMap(map,type);
    }catch(ex){
      throw ex;
    }
  }

  Media.fromJsonMap(Map<String,dynamic> map,MediaType type):
    poster_path = map["poster_path"]??"",
    overview = map["overview"],
    release_date = map[type==MediaType.MOVIE?"release_date":"first_air_date"],
    genre_ids = map["genre_ids"].toList(),
    id = map["id"],
    title = map[type==MediaType.MOVIE?"title":"name"],
    backdrop_path = map["backdrop_path"]??"",
    vote_average = map["vote_average"].toDouble();
}

enum MediaType{
  MOVIE,TV
}

enum MediaTypeQuery{
  TAB_POPULAR,TAB_TOPRATE,TAB_ON_AIR,TAB_UPCOMING
}
