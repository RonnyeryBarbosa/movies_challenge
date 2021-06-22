import 'package:movies_challege/adapter/storege_adapter.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/sql_adapter.dart';

class FavoriteModel {
  final StoregeAdapter storegeAdapter;
  Future<List<Movie>>? _movies;

  Future<List<Movie>> get movies => _movies!;

  FavoriteModel({StoregeAdapter? interanlStoregeAdapter})
      : storegeAdapter = interanlStoregeAdapter ?? SQLAdapter();

  feathFavorite() {
    _movies = storegeAdapter.getMovies();
  }
}
