import 'package:appforusetesting/models/model.dart';
import 'package:appforusetesting/services/repositories/repository.dart';

import 'dart:async';

class PopularMoviesDatabaseBloc {
  //Get instance of the Repository
  final _popularMoviesRepository = PopularMoviesDatabaseRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _popularMoviesController = StreamController<List<Result>>.broadcast();

  Stream<List<Result>> get popularMovies => _popularMoviesController.stream;

  PopularMoviesDatabaseBloc() {
    getPopularMovies();
  }

  Future<List<Result>> getPopularMoviesList() async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    return await _popularMoviesRepository.getAllPopularMovies();
  }

  getPopularMovies() async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _popularMoviesController.sink.add(await _popularMoviesRepository.getAllPopularMovies());
  }

  addTodo(Result result) async {
    await _popularMoviesRepository.insertPopularMovies(result);
    getPopularMovies();
  }
//
//  updateTodo(Result result) async {
//    await _popularMoviesRepository.updateTodo(todo);
//    getTodos();
//  }
//
//  deleteTodoById(int id) async {
//    _todoRepository.deleteTodoById(id);
//    getTodos();
//  }

  dispose() {
    _popularMoviesController.close();
  }
}
