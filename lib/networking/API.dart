import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:movies_challege/data/model/movie_response.dart';

class APIService {
  const APIService();
  Future<MovieResponse> fetchMovie() async {
    final authority = 'api.themoviedb.org';
    final path = '/3/movie/upcoming';
    final queryParameters = {
      'api_key': 'a5bc05fb630c9b7fdc560033345fa13e',
      'language': 'pt-BR'
    };
    final response =
        await http.get(Uri.https(authority, path, queryParameters));
    if (response.statusCode == 200) {
      print(response.body);
      return MovieResponse.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Nenhum Filme enconrado');
    }
  }
}
