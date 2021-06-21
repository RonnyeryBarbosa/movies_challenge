import 'dart:async';

import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/ui/screens/movies/movie_list_model.dart';

class MovieListViewModel {
  final _model = MovieListModel();

  Future<MovieResponse>? get movies => _model.movies;
  List<Movie>? get moviesList => _model.listMovies;

  StreamController<List<Movie>> streamMovie = StreamController();

  feathMovies() {
    _model.feathMovies();

    movies!.then((value) {
      streamMovie.add(moviesList!);
      _model.setCurrentPage(_incrementPage);
    });
  }

  int _incrementPage(int currentPage) {
    return currentPage + 1;
  }

  setRequest(String typeRequest) {
    _model.setRequestType(typeRequest);
  }
}
