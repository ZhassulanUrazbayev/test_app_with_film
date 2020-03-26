import 'dart:convert';
import 'package:equatable/equatable.dart';

Popular PopularFromJson(String str) {
  final jsonData = json.decode(str);
  return new Popular.fromJson(jsonData);
}

class Popular extends Equatable {
  int page;
  List<Result> results;
  int total_results;
  int total_pages;

  Popular({this.page, this.results, this.total_pages, this.total_results});

  factory Popular.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<Result> results = list.map((i) => Result.fromJson(i)).toList();

    return new Popular(
      page: json["page"],
      results: results,
      total_results: json["total_results"],
      total_pages: json["total_pages"],
    );
  }

  @override
  List<Object> get props => [page, results, total_results, total_pages];
}

class Result extends Equatable {
  String poster_path;
  bool adult;
  String overview;
  String release_date;
  String genre_ids;
  int id;
  String original_title;
  String original_language;
  String title;
  String backdrop_path;
  double popularity;
  int vote_count;
  bool video;
  double vote_average;

  Result(
      {this.poster_path,
      this.adult,
      this.overview,
      this.release_date,
      this.genre_ids,
      this.id,
      this.original_title,
      this.original_language,
      this.title,
      this.backdrop_path,
      this.popularity,
      this.vote_count,
      this.video,
      this.vote_average});

  factory Result.fromJson(Map<String, dynamic> json) {
    //This will be used to convert Popular Movies objects that
    //are came in Map<String, dynamic> a form of Result model
    return new Result(
        poster_path: json["poster_path"],
        adult: json["adult"].toString() == 'true' ? true : false,
        overview: json["overview"],
        release_date: json["release_date"],
        genre_ids: json['genre_ids'].toString(),
        id: json["id"],
        original_title: json["original_title"],
        original_language: json["original_language"],
        title: json["title"],
        backdrop_path: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        vote_count: json["vote_count"],
        video: json["video"].toString() == 'true' ? true : false,
        vote_average: json["vote_average"].toDouble());
  }

  Map<String, dynamic> toDatabaseJson() => {
        //This will be used to convert Popular Movies objects that
        //are to be stored into the database in a form of JSON
        "poster_path": this.poster_path,
        "adult": this.adult.toString(),
        "overview": this.overview,
        "release_date": this.release_date,
        "genre_ids": this.genre_ids.toString(),
        "idMovie": this.id,
        "original_title": this.original_title,
        "original_language": this.original_language,
        "title": this.title,
        "backdrop_path": this.backdrop_path,
        "popularity": this.popularity.toInt(),
        "vote_count": this.vote_count,
        "video": this.video.toString(),
        "vote_average": this.vote_average.toInt(),
      };

  @override
  List<Object> get props => [
        poster_path,
        adult,
        overview,
        release_date,
        genre_ids,
        id,
        original_title,
        original_language,
        title,
        backdrop_path,
        popularity,
        vote_average,
        vote_count,
        video
      ];
}
