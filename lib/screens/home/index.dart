import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviesapp/screens/movies/index.dart';
import 'package:moviesapp/utils/screen_ratio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String movieName;

  @override
  Widget build(BuildContext context) {
    ScreenRatio.setScreenRatio(
        currentScreenHeight: MediaQuery.of(context).size.height,
        currentScreenWidth: MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003973),
        title: Text(
          "Movies",
          style: TextStyle(
            fontSize: 24,
          ),
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
        padding: EdgeInsets.fromLTRB(
          10 * ScreenRatio.widthRatio,
          0,
          10 * ScreenRatio.widthRatio,
          0,
        ),
        child: Center(
          child: Container(
            height: 40 * ScreenRatio.heightRatio,
            width: ScreenRatio.screenwidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 300 * ScreenRatio.widthRatio,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search Movie Name...",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(
                        10 * ScreenRatio.widthRatio,
                        0,
                        0,
                        0,
                      ),
                    ),
                    textAlign: TextAlign.left,
                    onChanged: (value) {
                      setState(() {
                        movieName = value;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieList(
                              movieName: movieName,
                            ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
