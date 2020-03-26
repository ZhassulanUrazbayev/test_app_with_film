import 'package:appforusetesting/bloc/movie_event.dart';
import 'package:appforusetesting/models/model.dart';
import 'package:appforusetesting/services/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc({@required this.repository}) : assert(repository != null);

  @override
  MovieState get initialState => MovieEmpty();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovie) {
      yield MovieLoading();
      try {
        final Movie movie = await repository.fetchPopularMovies();
        yield MovieLoaded(movie: movie);
      } catch (_) {
        yield MovieError();
      }
    }
  }
}