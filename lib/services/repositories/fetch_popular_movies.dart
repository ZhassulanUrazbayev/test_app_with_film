
import 'package:appforusetesting/models/popular_movies_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PopularMoviesApiClient {
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  final String _baseImageUrl = "https://image.tmdb.org/t/p/w500";
  final String _apiKey = "7c306df82f88282cab6dbc20faa3bb50";
  final http.Client httpClient;

  PopularMoviesApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Popular> getPopularMoviesPage() async {
    final response =
        await this.httpClient.get("$_baseUrl/popular?api_key=$_apiKey");
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      return PopularFromJson(response.body);
    } else {
      print("Status code : ${response.statusCode}");
      throw Exception('Failed to load movies list');
    }
  }
}
