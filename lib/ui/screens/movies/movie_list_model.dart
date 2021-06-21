import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:movies_challege/networking/API.dart';

class MovieListModel {
  Future<List<Movie>>? _movies;
  Future<MovieResponse>? _movieResponse;
  String? _requetsType;

  List<Movie> _listMovies = [];

  int? _totalPage;
  int _page = 1;
  APIService api;

  Future<MovieResponse>? get movies => _movieResponse!;
  List<Movie>? get listMovies => _listMovies;

  MovieListModel({this.api = const APIService()});

  feathMovies({String? category}) {
    _movieResponse = api.fetchMovie(
      endPoint: _requetsType!,
      page: _page,
    );
    _movieResponse?.then((value) {
      _listMovies.addAll(value.movies!);
    });
  }

  setTotalPage(int total) {
    _totalPage = total;
  }

  setCurrentPage(Function(int) incrementePage) {
    _page = incrementePage(_page);
  }

  updateListMovies(List<Movie> movies) {
    _listMovies.addAll(movies);
  }

  setRequestType(String type) {
    _requetsType = type;
  }
}
