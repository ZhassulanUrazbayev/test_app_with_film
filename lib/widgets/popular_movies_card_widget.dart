
import 'package:appforusetesting/models/model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularMoviesCardItem extends StatefulWidget {
  final Result result;

  PopularMoviesCardItem({Key key, @required this.result}) : super(key: key);

  @override
  _PopularMoviesCardItemState createState() => _PopularMoviesCardItemState();
}

class _PopularMoviesCardItemState extends State<PopularMoviesCardItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child:
              CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${widget.result.poster_path}",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  width: 170,
                  child: Text(
                    '${widget.result.title}',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 0.7),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Color.fromRGBO(
                          255, 223, 0, widget.result.vote_average / 10),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${widget.result.vote_average}',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                    Text(
                      '/10',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '${widget.result.vote_count} votes',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
