import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movies_challege/data/model/cast.dart';
import 'package:movies_challege/data/model/movie.dart';

import 'package:movies_challege/data/model/movie_response.dart';

class APIService {
  const APIService();
  final authority = 'api.themoviedb.org';
  final pathDefault = '/3/';
  final apiKey = 'a5bc05fb630c9b7fdc560033345fa13e';
  final language = 'pt-BR';

  Future<MovieResponse> fetchMovie({String endPoint = "", int page = 1}) async {
    var path = pathDefault + endPoint;
    print(path);
    final queryParameters = {
      'api_key': apiKey,
      'language': language,
      'page': "$page"
    };
    final response =
        await http.get(Uri.https(authority, path, queryParameters));
    if (response.statusCode == 200) {
      print(response.body);
      return MovieResponse.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Nenhum Filme encontrado');
    }
  }

  Future<Movie> findMovie(
      {String endPoint = "", @required int? idMovie}) async {
    var path = pathDefault + endPoint + "/$idMovie";
    print(path);
    print(path);
    final queryParameters = {
      'api_key': apiKey,
      'language': language,
    };
    final response =
        await http.get(Uri.https(authority, path, queryParameters));
    if (response.statusCode == 200) {
      print(response.body);
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Nenhum Filme encontrado');
    }
  }

  Future<ResponseCast> findCast(
      {String endPoint = "", @required int? idMvie}) async {
    var path = pathDefault + endPoint + "/337404/" + "casts";
    print(path);
    print(path);
    final queryParameters = {
      'api_key': apiKey,
      'language': language,
    };
    final response =
        await http.get(Uri.https(authority, path, queryParameters));
    if (response.statusCode == 200) {
      print(response.body);
      return ResponseCast.fromJson(jsonDecode(response.body));
    } else {
      return Future.error('Nenhum Filme encontrado');
    }
  }
}
