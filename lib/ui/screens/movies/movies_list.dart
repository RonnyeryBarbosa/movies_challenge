
import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/constants/colors.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kTransparenceColor,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {},
                ),
                Text("Title filme")
              ],
            ),
            StreamBuilder<List<Movie>>(
                stream: null,
                builder: (context, snapshot) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return CardMovieFilm(image: snapshot.data![index].poster);
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
