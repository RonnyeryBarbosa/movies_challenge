import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/components/progress_view.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/favorites/favorites_model.dart';
import 'package:movies_challege/ui/screens/favorites/favorites_view_mode.dart';

class FavoritesView extends StatefulWidget {
  @override
  _FavoritesViewState createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  final _viewModel = FavoritesViewModel();

  @override
  Widget build(BuildContext context) {
    _viewModel.feachMovies();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kTransparenceColor,
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder<List<Movie>>(
                      stream: _viewModel.streamMovies.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ProgressView();
                        }
                        return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 4,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "movie_details",
                                    arguments: snapshot.data![index].id);
                              },
                              child: CardMovieFilm(
                                  image: snapshot.data![index].poster),
                            );
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
