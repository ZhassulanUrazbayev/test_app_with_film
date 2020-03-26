import 'dart:convert';
import 'package:equatable/equatable.dart';

Movie movieFromJson(String str) {
  final jsonData = json.decode(str);
  return new Movie.fromJson(jsonData);
}

class Movie extends Equatable {
  String title;
  String poster_path;
  String overview;
  double vote_average;
  String release_date;

  Movie(
      {this.title,
      this.poster_path,
      this.overview,
      this.vote_average,
      this.release_date});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return new Movie(
        title: json["title"],
        poster_path: json["poster_path"],
        overview: json["overview"],
        vote_average: json["vote_average"],
        release_date: json["release_date"]);
  }

  @override
  List<Object> get props => [title, poster_path, overview, vote_average, release_date];

  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Movie object that
        //are to be stored into the database in a form of JSON
        "poster_path": this.poster_path,
        "overview": this.overview,
        "release_date": this.release_date,
        "title": this.title,
        "vote_average": this.vote_average.toDouble(),
      };
}
