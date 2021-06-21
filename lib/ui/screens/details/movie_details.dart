import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/cast.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/components/info_geral_item.dart';
import 'package:movies_challege/ui/components/production_cast_item.dart';
import 'package:movies_challege/ui/components/progress_view.dart';
import 'package:movies_challege/ui/components/title_list.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/details/movie_details_view_model.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final _viewmodel = MovieDetailsViewModel();

  @override
  void initState() {
    _viewmodel.findMovie(movieId: 12);
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      _viewmodel.findMovie(
          movieId: ModalRoute.of(context)?.settings.arguments as int);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: kPrimaryColor,
          child: StreamBuilder<Movie>(
              stream: _viewmodel.streamMovie.stream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ProgressView());
                }

                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: kPrimaryColor,
                        child: Stack(
                          children: [
                            Image.network(
                              'https://image.tmdb.org/t/p/w300${snapshot.data!.banner}',
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.35,
                                color: Colors.black.withOpacity(0.4)),
                            Positioned(
                              top: 30,
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
                                    snapshot.data?.title ?? "",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 115,
                              left: 35,
                              child: Text(
                                snapshot.data?.title ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              top: 150,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${snapshot.data?.rating ?? ""}",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Text(snapshot.data?.genreInfo() ?? "",
                                        style: TextStyle(color: Colors.white)),
                                    Text(snapshot.data?.getYear() ?? "",
                                        style: TextStyle(color: Colors.white)),
                                    Text(snapshot.data?.getTime() ?? "",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 20,
                              bottom: 10,
                              child: FloatingActionButton(
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: kAccentColor,
                                ),
                                backgroundColor: Colors.black,
                                mini: true,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleList(title: "Sinopse"),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              snapshot.data?.overview ?? "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TitleList(title: "Direção"),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: StreamBuilder<List<Crew>>(
                                stream: _viewmodel.streamCrews.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return ProgressView();
                                  }
                                  if (snapshot.hasData) {
                                    return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ProductionCastItem(
                                          image:
                                              snapshot.data![index].profilePath,
                                          title: snapshot.data![index].name,
                                          description:
                                              snapshot.data![index].department,
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 20,
                                        );
                                      },
                                      itemCount: snapshot.data!.length,
                                    );
                                  }

                                  return Container();
                                }),
                          ),
                          TitleList(title: "Elenco"),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: StreamBuilder<List<Cast>>(
                                stream: _viewmodel.streamCasts.stream,
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return ProgressView();
                                  }

                                  if (snapshot.hasData) {
                                    return ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ProductionCastItem(
                                          image:
                                              snapshot.data![index].profilePath,
                                          title: snapshot.data![index].name,
                                          description:
                                              snapshot.data![index].character,
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 10,
                                        );
                                      },
                                      itemCount: snapshot.data!.length,
                                    );
                                  }

                                  return Container();
                                }),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
