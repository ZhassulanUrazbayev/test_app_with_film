import 'package:appforusetesting/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_page_card_widget.dart';

class MoviePageContent extends StatefulWidget {
  @override
  _MoviePageContentState createState() => _MoviePageContentState();
}

class _MoviePageContentState extends State<MoviePageContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
      if (state is MovieEmpty) {
        BlocProvider.of<MovieBloc>(context).add(FetchMovie());
      }
      if (state is MovieLoaded) {
        print(state.movie.release_date);
        return Scaffold(
          backgroundColor: Colors.white,
            body: Center(
              child: MovieCardItem(
          movie: state.movie,
        ),
            ));
      }
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
      ;
    });
  }
}
