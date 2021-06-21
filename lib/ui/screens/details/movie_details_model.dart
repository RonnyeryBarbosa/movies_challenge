import 'package:flutter/cupertino.dart';
import 'package:movies_challege/data/model/cast.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/networking/API.dart';
import 'package:movies_challege/networking/EndPoints.dart';

class MovieDetailsModel {
  Future<Movie>? _movieResponse;
  Future<ResponseCast>? _responseCast;
  final APIService api;

  Future<Movie>? get movieResponse => _movieResponse;
  Future<ResponseCast>? get responseCast => _responseCast;

  MovieDetailsModel({this.api = const APIService()});

  findMovie({@required int? movieId}) {
    _movieResponse = api.findMovie(endPoint: "movie", idMvie: movieId);
  }

  findCast({@required int? movieId}) {
    _responseCast = api.findCast(endPoint: "movie", idMvie: movieId);
  }
}
