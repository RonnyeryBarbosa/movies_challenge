import 'package:movies_challege/data/model/movie.dart';

class MovieResponse {
  int? page;
  int? totalPage;
  List<Movie>? movies;
  MovieResponse(this.movies);
  MovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPage = json['total_page'];
    movies = List<Movie>.from(json['results'].map((x) => Movie.fromJson(x)));
  }

  MovieResponse.fromMap(List<Map<String, dynamic>> json) {
    movies = List.generate(json.length, (index) {
      print(json);
      return Movie(json[index]['id'], "", "", json[index]['poster'], "",
          json[index]['favorite']);
    });
  }
}
