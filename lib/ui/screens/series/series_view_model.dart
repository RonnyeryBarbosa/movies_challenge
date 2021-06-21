import 'dart:async';
import 'dart:math';

import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/ui/screens/home/home_model.dart';
import 'package:movies_challege/ui/screens/series/series_model.dart';

class SeriesViewModel {
  final _model = SeriesModel();

  Future<MovieResponse> get onTheAir => _model.onTheAir;
  Future<MovieResponse> get airingToday => _model.airingToday;
  Future<MovieResponse> get topRated => _model.topRated;

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
    _model.feathAiringToday();
    _model.feathTopRated();
    _model.feathOnTheAir();

    onTheAir.then((value) {
      streamMovies.add(value.movies!.sublist(0, 10));
      value.movies!.shuffle(Random());
      print(" sdsd ${value.movies!.length}");
      fetchFeaturedBanner(value.movies!.sublist(0, 5));
    });

    airingToday.then((value) {
      print("rrrr ${value.movies!.length}");
      streamNowMovie.add(value.movies!);
    });
    topRated.then((value) {
      streamPopularMovie.add(value.movies!);
    });
  }

  fetchFeaturedBanner(List<Movie> movies) {
    for (Movie a in movies) {
      print("aqui ${a.name}");
    }
    streamBanner.add(movies);
  }
}
