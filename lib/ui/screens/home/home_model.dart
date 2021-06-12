import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/networking/API.dart';

class HomeModel {
  int _currentPage = 0;
  APIService api;
  Future<MovieResponse>? _movieResponse;
  Future<MovieResponse> get movieResponse => _movieResponse!;

  HomeModel({this.api = const APIService()});

  int get currentPage => _currentPage;

  updatePage(page) => _currentPage = page;

  feathMovies() {
    _movieResponse = api.fetchMovie();
  }
}
