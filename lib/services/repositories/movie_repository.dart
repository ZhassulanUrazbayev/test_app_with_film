import 'package:flutter/material.dart';
import 'package:appforusetesting/models/model.dart';
import 'fetch_movie.dart';

class MovieRepository {
  final MoviesApiClient moviesApiClient;
  final int id;

  MovieRepository({@required this.moviesApiClient, @required this.id})
      : assert(moviesApiClient != null, id != null);

  Future<Movie> fetchPopularMovies() async {
    return await moviesApiClient.getMovie(this.id);
  }
}