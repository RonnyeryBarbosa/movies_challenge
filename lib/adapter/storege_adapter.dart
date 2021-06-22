import 'package:movies_challege/data/model/movie.dart';

abstract class StoregeAdapter {
  Future<bool> saveMovie(Movie movie);
  Future<bool> deleteMovie(int idMovie);
  Future<List<Movie>> getMovies();
  Future<bool> isFavorite(int idMovie);
}
