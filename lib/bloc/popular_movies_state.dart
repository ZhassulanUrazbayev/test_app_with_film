import 'package:appforusetesting/models/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesEmpty extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final Popular popular;

  const PopularMoviesLoaded({@required this.popular}) : assert(popular != null);

  @override
  List<Object> get props => [popular];
}

class PopularMoviesError extends PopularMoviesState {}