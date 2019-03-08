import 'package:movie_app/Commons/HttpHandler.dart';
import 'package:movie_app/models/Media.dart';

abstract class MediaProvider{
  HttpHandler _client = HttpHandler.get();
  Future<List<Media>> fetchMedia();
}


class MovieProvider extends MediaProvider{
  @override
  Future<List<Media>> fetchMedia() => _client.fetchMedia(MediaType.MOVIE);
}

class ShowProvider extends MediaProvider{
  @override
  Future<List<Media>> fetchMedia() => _client.fetchMedia(MediaType.TV);
}