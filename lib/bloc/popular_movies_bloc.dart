import 'package:appforusetesting/bloc/popular_movies_database_bloc.dart';
import 'package:appforusetesting/models/model.dart';
import 'package:appforusetesting/services/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final PopularMoviesRepository repository;

  PopularMoviesBloc({@required this.repository}) : assert(repository != null);

  @override
  PopularMoviesState get initialState => PopularMoviesEmpty();

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is FetchPopularMovies) {
      yield PopularMoviesLoading();
      try {
        final Popular popular = await repository.fetchPopularMovies();
        yield PopularMoviesLoaded(popular: popular);
      } catch (_) {
        yield PopularMoviesError();
      }
    }
  }
}