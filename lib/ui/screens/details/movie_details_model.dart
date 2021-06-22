import 'package:flutter/cupertino.dart';
import 'package:movies_challege/adapter/storege_adapter.dart';
import 'package:movies_challege/data/model/cast.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/sql_adapter.dart';
import 'package:movies_challege/networking/API.dart';

class MovieDetailsModel {
  Future<Movie>? _movieResponse;
  Future<ResponseCast>? _responseCast;
  Future<bool>? _isFavorite;

  final APIService api;
  final StoregeAdapter storegeAdapter;
  Movie? _movie;

  Future<Movie>? get movieResponse => _movieResponse;
  Future<ResponseCast>? get responseCast => _responseCast;
  Future<bool>? get isFavorite => _isFavorite;

  MovieDetailsModel(
      {this.api = const APIService(), StoregeAdapter? interanlStoregeAdapter})
      : storegeAdapter = interanlStoregeAdapter ?? SQLAdapter();

  setMovie(Movie movie) {
    _movie = movie;
  }

  findMovie({@required int? movieId}) {
    _movieResponse = api.findMovie(endPoint: "movie", idMovie: movieId);
  }

  findCast({@required int? movieId}) {
    _responseCast = api.findCast(endPoint: "movie", idMvie: movieId);
  }

  favoriteMovie() {
    if (_movie != null) {
      if (_movie!.favorite == 1) {
        _movie!.favorite = 0;
        _isFavorite = storegeAdapter.deleteMovie(_movie!.id!);
        return;
      }
      _movie!.favorite = 1;
      _isFavorite = storegeAdapter.saveMovie(_movie!);
    }
  }

  checkIsFavorite() {
    _isFavorite = storegeAdapter.isFavorite(_movie!.id!);
  }
}
