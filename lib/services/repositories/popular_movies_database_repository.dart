import 'package:appforusetesting/dao/dao.dart';
import 'package:appforusetesting/models/model.dart';

class PopularMoviesDatabaseRepository {
  final popularMoviesDao = PopularMoviesDao();

  Future getAllPopularMovies() => popularMoviesDao.getPopularMovies();

  Future insertPopularMovies(Result result) => popularMoviesDao.createPopularMovie(result);
}