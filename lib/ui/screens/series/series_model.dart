import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/networking/API.dart';
import 'package:movies_challege/networking/EndPoints.dart';

class SeriesModel {
  int _currentPage = 0;
  APIService api;
  Future<MovieResponse>? _onTheAir;
  Future<MovieResponse>? _airingToday;
  Future<MovieResponse>? _topRated;

  Future<MovieResponse> get onTheAir => _onTheAir!;
  Future<MovieResponse> get airingToday => _airingToday!;
  Future<MovieResponse> get topRated => _topRated!;

  SeriesModel({this.api = const APIService()});

  int get currentPage => _currentPage;

  updatePage(page) => _currentPage = page;

  feathTopRated() {
    _topRated = api.fetchMovie(endPoint: REQUEST_TV_TOP_RATED);
  }

  feathAiringToday() {
    _airingToday = api.fetchMovie(endPoint: REQUEST_TV_AIRING_TODAY);
  }

  feathOnTheAir() {
    _onTheAir = api.fetchMovie(endPoint: REQUEST_TV_ON_THE_AIR);
  }
}
