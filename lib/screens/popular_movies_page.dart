import 'package:appforusetesting/bloc/popular_movies_database_bloc.dart';
import 'package:appforusetesting/models/model.dart';
import 'package:appforusetesting/services/repositories/repository.dart';
import 'package:appforusetesting/widgets/popular_movies_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appforusetesting/bloc/bloc.dart';

import 'movie_page.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  final PopularMoviesDatabaseRepository repositoryDatabase =
      PopularMoviesDatabaseRepository();
  final PopularMoviesDatabaseBloc todoBloc = PopularMoviesDatabaseBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesEmpty) {
          BlocProvider.of<PopularMoviesBloc>(context).add(FetchPopularMovies());
        }
        if (state is PopularMoviesError) {
          return FutureBuilder(
            future: todoBloc.getPopularMoviesList(),
            builder: (context, AsyncSnapshot<List<Result>> snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PopularMoviesCardItem(
                            result: snapshot.data[index]);
                      }),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        }
        if (state is PopularMoviesLoaded) {
//        Adding each Result(Popular Movie) into database

          for (int i = 0; i < state.popular.results.length; i++) {
            repositoryDatabase.insertPopularMovies(state.popular.results[i]);
          }

          return new RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: state.popular.results.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MoviePage(id: state.popular.results[index].id,)),
                    );
                  },
                  child: PopularMoviesCardItem(
                      result: state.popular.results[index]),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

//  Refreshing each swipe refresh operation to get data from server
  Future<Null> _refresh() async {
    BlocProvider.of<PopularMoviesBloc>(context).add(FetchPopularMovies());

    print('refreshing stocks...');
  }
}
