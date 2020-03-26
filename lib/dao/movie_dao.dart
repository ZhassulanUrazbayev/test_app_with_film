import 'dart:async';
import 'package:appforusetesting/database/database.dart';
import 'package:appforusetesting/models/model.dart';

class movieDao {
  final dbProvider = DatabaseProviderMovie.dbProvider;

  //Adds new Movie record
  Future<int> createMovie(Movie movie) async {
    final db = await dbProvider.database;
    var result = await db.query(movieTABLE);
    var isExist = false;
    if (result.isNotEmpty) {
      for (int i = 0;
          i < result.map((item) => Movie.fromJson(item)).toList().length;
          i++) {
        if (result.map((item) => Movie.fromJson(item)).toList()[i].title ==
            movie.title) {
          isExist = true;
        }
      }
      if (!isExist) {
        db.insert(movieTABLE, movie.toDatabaseJson());
      }
    } else {
      db.insert(movieTABLE, movie.toDatabaseJson());
    }
    return 1;
  }

  //Get All Movies items
  Future<Movie> getMovie(String title) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    Movie movie;

    result = await db.query(popularMoviesTABLE);

    for (int i = 0;
        i < result.map((item) => Movie.fromJson(item)).toList().length;
        i++) {
      if (result.map((item) => Movie.fromJson(item)).toList()[i].title ==
          title) {
        movie = result.map((item) => Movie.fromJson(item)).toList()[i];
      }
    }

    return movie;
  }
}
