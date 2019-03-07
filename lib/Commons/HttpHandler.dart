import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie_app/Commons/constantes.dart';
import 'package:movie_app/models/Media.dart';

class HttpHandler {
  final _baseUrl = "api.themoviedb.org";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    print(response.statusCode);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovie() {
    var uri = Uri.http(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY,
          'page': "1",

        });

    return getJson(uri).then(((data)=>
    data['result'].map<Media>((it) => Media(it)).toList()
    ));

  }
}
