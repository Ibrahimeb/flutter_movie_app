import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/models/Media.dart';

abstract class MediaProvider{
  HttpHandler _client = HttpHandler.get();
  Future<List<Media>> fetchMediaPopular(MediaTypeQuery query);
}


class MovieProvider extends MediaProvider{
  @override
  Future<List<Media>> fetchMediaPopular(MediaTypeQuery query) => _client.fetchMedia(MediaType.MOVIE,query);
}

class ShowProvider extends MediaProvider{
  @override
  Future<List<Media>> fetchMediaPopular(MediaTypeQuery query) => _client.fetchMedia(MediaType.TV,query);
}