import 'dart:async';

import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/screens/favorites/favorites_model.dart';

class FavoritesViewModel {
  final _model = FavoriteModel();

  Future<List<Movie>> get movies => _model.movies;

  StreamController<List<Movie>> streamMovies = StreamController();

  feachMovies() {
    _model.feathFavorite();

    _model.movies.then((value) {
      streamMovies.add(value);
    });
  }
}
