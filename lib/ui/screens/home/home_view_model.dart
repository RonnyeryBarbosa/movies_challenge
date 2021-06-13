import 'dart:async';
import 'dart:math';

import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/ui/screens/home/home_model.dart';

class HomeViewModel {
  final _model = HomeModel();

  Future<MovieResponse> get movieResponse => _model.movieResponse;
  Future<MovieResponse> get nowPlayMovies => _model.nowPlayingMovies;
  Future<MovieResponse> get popularMovies => _model.popularMovies;

  StreamController<int> streamCurrentPage = StreamController();
  StreamController<List<Movie>> streamMovies = StreamController();
  StreamController<List<Movie>> streamBanner = StreamController();
  StreamController<List<Movie>> streamNowMovie = StreamController();
  StreamController<List<Movie>> streamPopularMovie = StreamController();

  updatePage(page) {
    print(page);
    streamCurrentPage.add(page);
  }

  fetchMovie({int sizeList = 5}) {
    _model.feathMoviesUpcoming();
    _model.feathMoviewNowPlaying();
    _model.feathMoviewPopular();

    movieResponse.then((value) {
      streamMovies.add(value.movies!.sublist(0, 10));
      value.movies!.shuffle(Random());
      print(value.movies!.length);
      fetchFeaturedBanner(value.movies!.sublist(0, 5));
    });

    nowPlayMovies.then((value) {
      print("rrrr ${value.movies!.length}");
      streamNowMovie.add(value.movies!);
    });
    popularMovies.then((value) {
      streamPopularMovie.add(value.movies!);
    });
  }

  fetchFeaturedBanner(List<Movie> movies) {
    streamBanner.add(movies);
  }
}
