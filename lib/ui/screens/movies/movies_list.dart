import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/components/progress_view.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/movies/movie_list_view_model.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _viewModel = MovieListViewModel();

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      _viewModel
          .setRequest(ModalRoute.of(context)?.settings.arguments as String);

      _viewModel.feathMovies();
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kTransparenceColor,
          child: Container(
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<Movie>>(
                      stream: _viewModel.streamMovie.stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ProgressView();
                        }
                        return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 4,
                                  crossAxisSpacing: 4,
                                  mainAxisSpacing: 4),
                          itemBuilder: (context, index) {
                            print(index);
                            if (index == (snapshot.data!.length - 4)) {
                              _viewModel.feathMovies();
                            }
                            return CardMovieFilm(
                                image: snapshot.data![index].poster);
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
