import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/Commons/constantes.dart';
import 'package:movie_app/models/Media.dart';

class HttpHandler {
  final _baseUrl = "api.themoviedb.org";
  final String MOVIE ="movie";
  final String TVSHOW ="tv";

  static final _httpHandler= HttpHandler();

  static HttpHandler get() => _httpHandler;

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);

    print(response.statusCode);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMedia(MediaType type,MediaTypeQuery queryType) {
    var path = type == MediaType.MOVIE?MOVIE:TVSHOW;
    var query;
    switch (queryType){
      case MediaTypeQuery.TAB_POPULAR:
        query = "popular";
        break;
      case MediaTypeQuery.TAB_ON_AIR:
        query = "on_the_air";
        break;
      case MediaTypeQuery.TAB_TOPRATE:
        query = "top_rated";
        break;
      case MediaTypeQuery.TAB_UPCOMING:
        query = "upcoming";
        break;
    }


    var endpoint = "3/$path/$query";
    var uri = Uri.http(_baseUrl, endpoint,
        {'api_key': API_KEY,
          'page': "1",
          'language':"en-US"
        });

    return getJson(uri).then(((data)=>
    data['results'].map<Media>((it) => Media(it,type)).toList()
    ));
  }








}
