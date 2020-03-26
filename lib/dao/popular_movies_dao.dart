import 'dart:async';
import 'package:appforusetesting/database/database.dart';
import 'package:appforusetesting/models/model.dart';

class PopularMoviesDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Popular Movie record
  Future<int> createPopularMovie(Result results) async {
    final db = await dbProvider.database;
    var result = await db.query(popularMoviesTABLE);
    var isExist = false;
    if (result.isNotEmpty) {
      for (int i = 0;
          i < result.map((item) => Result.fromJson(item)).toList().length;
          i++) {
        if (result.map((item) => Result.fromJson(item)).toList()[i].title ==
            results.title) {
          isExist = true;
        }
      }
      if (!isExist) {
        db.insert(popularMoviesTABLE, results.toDatabaseJson());
      }
    } else {
      db.insert(popularMoviesTABLE, results.toDatabaseJson());
    }
    return 1;
  }

  //Get All Popular Movies items
  Future<List<Result>> getPopularMovies() async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;

    result = await db.query(popularMoviesTABLE);

    List<Result> results = result.isNotEmpty
        ? result.map((item) => Result.fromJson(item)).toList()
        : [];
    return results;
  }
}
