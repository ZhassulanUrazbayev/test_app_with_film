import 'package:flutter/material.dart';
import 'package:appforusetesting/models/model.dart';
import 'fetch_popular_movies.dart';

class PopularMoviesRepository {
  final PopularMoviesApiClient popularMoviesApiClient;

  PopularMoviesRepository({@required this.popularMoviesApiClient})
      : assert(popularMoviesApiClient != null);

  Future<Popular> fetchPopularMovies() async {
    return await popularMoviesApiClient.getPopularMoviesPage();
  }
}