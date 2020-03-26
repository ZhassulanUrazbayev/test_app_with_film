import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchMovie extends MovieEvent {
  const FetchMovie();

  @override
  List<Object> get props => [];
}