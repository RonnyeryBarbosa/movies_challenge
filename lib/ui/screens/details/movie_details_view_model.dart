import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:movies_challege/data/model/cast.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/screens/details/movie_details_model.dart';

class MovieDetailsViewModel {
  final _model = MovieDetailsModel();

  Future<Movie>? get movieResponse => _model.movieResponse;
  Future<ResponseCast>? get responseCast => _model.responseCast;
  Future<bool>? get isFavorite => _model.isFavorite;

  StreamController<Movie> streamMovie = StreamController();
  StreamController<List<Cast>> streamCasts = StreamController();
  StreamController<List<Crew>> streamCrews = StreamController();
  StreamController<bool> streamFavorite = StreamController();

  findMovie({@required int? movieId}) {
    findCast(movieId: movieId);
    _model.findMovie(movieId: movieId);
    movieResponse!.then((value) {
      _model.setMovie(value);
      _model.checkIsFavorite();
      streamMovie.add(value);
      isFavorite!.then((value) {
        print("faco ${value}");
        streamFavorite.add(value);
      });
    });
  }

  findCast({@required int? movieId}) {
    _model.findCast(movieId: movieId);
    responseCast!.then((value) {
      streamCasts.add(value.cast!);
      streamCrews.add(value.crew!);
    });
  }

  favoriteMovie() {
    _model.favoriteMovie();
    isFavorite!.then((value) {
      print("faco88 ${value}");
      streamFavorite.add(value);
    });
  }
}
