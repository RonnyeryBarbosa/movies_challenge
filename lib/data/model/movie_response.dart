import 'package:movies_challege/data/model/movie.dart';

class MovieResponse {
  List<Movie>? movies;
  MovieResponse(this.movies);
  MovieResponse.fromJson(Map<String, dynamic> json) {
    movies = List<Movie>.from(json['results'].map((x) => Movie.fromJson(x)));
  }
}
