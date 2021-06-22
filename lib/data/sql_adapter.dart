import 'package:movies_challege/adapter/storege_adapter.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/data/model/movie_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends StoregeAdapter {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDB();
    print(_database?.path);
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'movie_databese.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE Movies(id INTEGER PRIMARY KEY , poster TEXT, favorite INTEGER)');
    }, version: 1);
  }

  @override
  Future<bool> deleteMovie(int idMovie) async {
    final Database db = await database;
    var response =
        await db.delete('Movies', where: 'id = ?', whereArgs: [idMovie]);

    print('delete item');
    return !(response == 1);
  }

  @override
  Future<List<Movie>> getMovies() async {
    final Database db = await database;
    //var response = await db.query('Movies');

    final List<Map<String, dynamic>> maps = await db.query('Movies');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Movie(
          maps[i]['id'], "", "", maps[i]['poster'], "", maps[i]['favorite']);
    });
  }

  @override
  Future<bool> saveMovie(Movie movie) async {
    final Database db = await database;

    var response = await db.insert('Movies', movie.toJson());
    print('movie salvo $response');

    return response == movie.id;
  }

  @override
  Future<bool> isFavorite(int idMovie) async {
    final Database db = await database;
    var response =
        await db.query('Movies', where: 'id = ?', whereArgs: [idMovie]);
    if (response.isNotEmpty) {
      final movie = Movie.fromJson(response.first);
      return movie.favorite == 1;
    } else {
      return false;
    }
  }
}
