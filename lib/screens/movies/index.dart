import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:moviesapp/data/movies_scoped_model.dart';
import 'package:moviesapp/model/movies_model.dart';
import 'package:moviesapp/utils/screen_ratio.dart';
import 'package:moviesapp/widgets/movies_hero_animation.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieList extends StatefulWidget {
  String movieName;
  MovieList({Key key, this.movieName});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesModel moviesModel = MoviesModel();
  @override
  void initState() {
    super.initState();
    moviesModel.getData(widget.movieName);
  }

  Widget moviesBuilder(Search movie) {
    return Card(
      elevation: 2,
      child: Container(
        padding: EdgeInsets.fromLTRB(
          5 * ScreenRatio.widthRatio,
          5 * ScreenRatio.heightRatio,
          5 * ScreenRatio.widthRatio,
          5 * ScreenRatio.heightRatio,
        ),
        child: Column(
          children: <Widget>[
            PhotoHero(
              photo: movie.poster,
              width: 300 * ScreenRatio.widthRatio,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xFF003973),
                    ),
                    body: Container(
                      decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                          colors: [
                            Color(0xFF003973),
                            Color(0xFF003973),
                            Color(0xFF56B4D3),
                            Color(0XFF56B4D3),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 0.3, 0.6, 1.0],
                          tileMode: TileMode.repeated,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            movie.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20 * ScreenRatio.heightRatio,
                          ),
                          PhotoHero(
                            photo: movie.poster,
                            width: 300 * ScreenRatio.widthRatio,
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(
                            height: 20 * ScreenRatio.heightRatio,
                          ),
                          Text(
                            "Year: ${movie.year}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Type: ${movie.type}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "ImdbID: ${movie.imdbID}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
              },
            ),
            SizedBox(
              height: 10 * ScreenRatio.heightRatio,
            ),
            Text(
              movie.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003973),
        title: Text(
          widget.movieName,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Color(0xFF003973),
              Color(0xFF003973),
              Color(0xFF56B4D3),
              Color(0XFF56B4D3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.3, 0.6, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),
        child: ScopedModel<MoviesModel>(
          model: moviesModel,
          child: ScopedModelDescendant<MoviesModel>(
            builder: (BuildContext context, Widget child, MoviesModel model) {
              return model.isLoading
                  ? model.obj.search != null
                      ? ListView.builder(
                          itemCount: model.obj.search.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(
                                40 * ScreenRatio.widthRatio,
                                5 * ScreenRatio.heightRatio,
                                40 * ScreenRatio.widthRatio,
                                5 * ScreenRatio.heightRatio,
                              ),
                              child: moviesBuilder(model.obj.search[index]),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "Result Not Found",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
