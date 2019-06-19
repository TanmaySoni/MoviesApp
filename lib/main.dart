import 'package:flutter/material.dart';
import 'package:moviesapp/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: routesList,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
