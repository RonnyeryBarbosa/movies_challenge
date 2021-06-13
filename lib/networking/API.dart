import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies_challege/data/model/movie_response.dart';

class APIService {
  const APIService();
  final authority = 'api.themoviedb.org';
  final pathDefault = '/3/movie';
  final apiKey = 'a5bc05fb630c9b7fdc560033345fa13e';
  final language = 'pt-BR';

  Future<MovieResponse> fetchMovie(String endPoint) async {
    var path = pathDefault + endPoint;
    print(path);
    final queryParameters = {'api_key': apiKey, 'language': language};
    final response =
        await http.get(Uri.https(authority, path, queryParameters));
    if (response.statusCode == 200) {
      print(response.body);
      return MovieResponse.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Nenhum Filme encontrado');
    }
  }
}
