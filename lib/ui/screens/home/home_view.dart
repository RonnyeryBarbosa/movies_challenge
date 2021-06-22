import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/networking/EndPoints.dart';
import 'package:movies_challege/ui/components/card_button_mode.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/components/progress_view.dart';
import 'package:movies_challege/ui/components/title_list.dart';
import 'package:movies_challege/ui/components/view_page.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _viewModel = HomeViewModel();
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Wecome to Tokoto, Let' shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png",
    },
  ];

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
                      label: "Lançamentos",
                      stream: _viewModel.streamMovies.stream,
                      typeRequest: REQUEST_UPCOMING,
                    ),
                    ListMoviesView(
                      label: "Em Exibição",
                      stream: _viewModel.streamNowMovie.stream,
                      typeRequest: REQUEST_NOW_PLAYING,
                    ),
                    ListMoviesView(
                        label: "Melhores avaliados",
                        stream: _viewModel.streamPopularMovie.stream,
                        typeRequest: REQUEST_POPULAR),
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
                          onTap: () {
                            Navigator.pushNamed(context, "movie_details",
                                arguments: snapshotM.data![index].id);
                          },
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
                })
            // ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     CardMovieFilm(),
            //     CardMovieFilm(),
            //     CartButtonMore()
            //   ],
            // ),
            ),
      ],
    );
  }
}

// Widget circleBar(bool isActive) {
//   return AnimatedContainer(
//     duration: Duration(milliseconds: 150),
//     margin: EdgeInsets.symmetric(horizontal: 8),
//     height: isActive ? 12 : 8,
//     width: isActive ? 12 : 8,
//     decoration: BoxDecoration(
//         color: isActive ? kPrimaryColor : kAccentColor,
//         borderRadius: BorderRadius.all(Radius.circular(12))),
//   );
// }
