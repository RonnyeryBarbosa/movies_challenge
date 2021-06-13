import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/networking/API.dart';
import 'package:movies_challege/networking/EndPoints.dart';

class HomeModel {
  int _currentPage = 0;
  APIService api;
  Future<MovieResponse>? _movieResponse;
  Future<MovieResponse>? _nowPlayingMovies;
  Future<MovieResponse>? _popularMovies;

  List<Movie>? _movieListUpcoming;

  Future<MovieResponse> get movieResponse => _movieResponse!;
  Future<MovieResponse> get nowPlayingMovies => _nowPlayingMovies!;
  Future<MovieResponse> get popularMovies => _popularMovies!;

  List<Movie> get movieListUpcoming => _movieListUpcoming!;

  HomeModel({this.api = const APIService()});

  int get currentPage => _currentPage;

  updatePage(page) => _currentPage = page;

  feathMoviesUpcoming() {
    _movieResponse = api.fetchMovie(REQUEST_UPCOMING);
  }

  feathMoviewNowPlaying() {
    _nowPlayingMovies = api.fetchMovie(REQUEST_NOW_PLAYING);
  }

  feathMoviewPopular() {
    _popularMovies = api.fetchMovie(REQUEST_POPULAR);
  }
}
