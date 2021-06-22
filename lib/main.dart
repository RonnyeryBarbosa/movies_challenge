import 'package:flutter/material.dart';
import 'package:movies_challege/ui/screens/details/movie_details.dart';
import 'package:movies_challege/ui/screens/home/home_view.dart';
import 'package:movies_challege/navigation_home.dart';
import 'package:movies_challege/ui/screens/movies/movies_list.dart';
import 'package:movies_challege/ui/screens/series/series_view.dart';

void main() {
  runApp(MaterialApp(
    home: NavigationHomeView(),
    routes: {
      "movie_list": (context) => MovieList(),
      "movie_details": (context) => MovieDetails(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return Scaffold(body: NavigationHomeView());
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.apartment_outlined,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
