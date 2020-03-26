import 'package:appforusetesting/screens/popular_movies_page.dart';
import 'package:appforusetesting/services/repositories/fetch_popular_movies.dart';
import 'package:appforusetesting/services/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final PopularMoviesRepository repository = PopularMoviesRepository(
    popularMoviesApiClient: PopularMoviesApiClient(
      httpClient: http.Client(),
    ),
  );
  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final PopularMoviesRepository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'Popular Movies Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: BlocProvider(
          create: (context) => PopularMoviesBloc(repository: repository),
          child: PopularMoviesPage(),
        ),
      ),
    );
  }
}