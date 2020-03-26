import 'package:appforusetesting/bloc/movie_bloc.dart';
import 'package:appforusetesting/services/repositories/fetch_movie.dart';
import 'package:appforusetesting/services/repositories/repository.dart';
import 'package:appforusetesting/widgets/movie_page_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  final int id;

  MoviePage({@required this.id}) : assert(id != null);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {

    final MovieRepository repository = MovieRepository(
        moviesApiClient: MoviesApiClient(
          httpClient: http.Client(),
        ),
        id: widget.id
    );

    return BlocProvider(
      create: (context) => MovieBloc(repository: repository),
      child: MoviePageContent(),
    );
  }
}
