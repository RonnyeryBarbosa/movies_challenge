import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/networking/EndPoints.dart';
import 'package:movies_challege/ui/components/card_button_mode.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/components/progress_view.dart';
import 'package:movies_challege/ui/components/title_list.dart';
import 'package:movies_challege/ui/components/view_page.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/series/series_view_model.dart';

class SeriesView extends StatefulWidget {
  @override
  _SeriesViewState createState() => _SeriesViewState();
}

class _SeriesViewState extends State<SeriesView> {
  final _viewModel = SeriesViewModel();
  int currentPage = 0;

  @override
  void initState() {
    _viewModel.fetchMovie();
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Container(
        color: kTransparenceColor,
        child: StreamBuilder<List<Movie>>(
            stream: _viewModel.streamBanner.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return ProgressView();
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.white,
                        child: Stack(children: [
                          PageView(
                            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                            /// Use [Axis.vertical] to scroll vertically.
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (value) {
                              _viewModel.updatePage(value);
                            },
                            controller: controller,
                            children: List.generate(
                              snapshot.data!.length,
                              (index) => BannerViewPage(
                                  movie: snapshot.data!.elementAt(index)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: StreamBuilder<int>(
                                stream: _viewModel.streamCurrentPage.stream,
                                builder: (context, snapshot3) {
                                  return Container(
                                    margin:
                                        EdgeInsets.only(bottom: 20, left: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: List.generate(
                                        snapshot.data!.length,
                                        (index) => buildDot(
                                            index: index,
                                            data: snapshot3.data ?? 0),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ])),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: kAccentColor,
                    ),
                    ListMoviesView(
                      label: "Transmitindo hoje",
                      stream: _viewModel.streamMovies.stream,
                      typeRequest: REQUEST_TV_ON_THE_AIR,
                    ),
                    ListMoviesView(
                      label: "Na Tv",
                      stream: _viewModel.streamNowMovie.stream,
                      typeRequest: REQUEST_TV_AIRING_TODAY,
                    ),
                    ListMoviesView(
                        label: "Melhores avaliados",
                        stream: _viewModel.streamPopularMovie.stream,
                        typeRequest: REQUEST_TV_TOP_RATED),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  AnimatedContainer buildDot({required int index, required int data}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      width: index == data ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: index == data ? kAccentColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class ListMoviesView extends StatelessWidget {
  final label;
  final stream;
  final typeRequest;
  const ListMoviesView({
    this.label,
    this.stream,
    this.typeRequest,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleList(title: label),
        Container(
            margin: EdgeInsets.only(left: 20),
            height: MediaQuery.of(context).size.height * 0.2,
            child: StreamBuilder<List<Movie>>(
                stream: stream,
                builder: (context, snapshotM) {
                  if (!snapshotM.hasData) {
                    return CircularProgressIndicator();
                  }

                  return ListView.separated(
                    itemCount: snapshotM.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == snapshotM.data!.length - 1) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "movie_list",
                                arguments: typeRequest);
                          },
                          child: CartButtonMore(action: () {}),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {},
                          child: CardMovieFilm(
                              image: snapshotM.data![index].poster),
                        );
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  );
                })),
      ],
    );
  }
}
