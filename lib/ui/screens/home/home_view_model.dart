import 'dart:async';

import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/ui/screens/home/home_model.dart';

class HomeViewModel {
  final _model = HomeModel();

  Future<MovieResponse> get movieResponse => _model.movieResponse;

  StreamController<int> streamCurrentPage = StreamController();
  StreamController<List<Movie>> streamMovies = StreamController();

  updatePage(page) {
    print(page);
    streamCurrentPage.add(page);
  }

  fetchMovie() {
    _model.feathMovies();
    movieResponse.then((value) {
      streamMovies.add(value.movies!.sublist(0, 5));
    });
  }
}
