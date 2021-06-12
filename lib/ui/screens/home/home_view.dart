import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/components/card_button_mode.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
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
        color: kPrimaryColor,
        child: StreamBuilder<List<Movie>>(
            stream: _viewModel.streamMovies.stream,
            builder: (context, snapshot) {
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
                          Positioned(
                            top: 220,
                            left: 80,
                            child: StreamBuilder<int>(
                                stream: _viewModel.streamCurrentPage.stream,
                                builder: (context, snapshot2) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      snapshot.data!.length,
                                      (index) => buildDot(
                                          index: index,
                                          data: snapshot2.data ?? 0),
                                    ),
                                  );
                                }),
                          )
                        ])),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 0.6,
                      color: Colors.grey,
                    ),
                    TitleList(title: "Lançamentos"),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CartButtonMore()
                        ],
                      ),
                    ),
                    TitleList(title: "Em Exibição"),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CartButtonMore()
                        ],
                      ),
                    ),
                    TitleList(title: "Populares"),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CardMovieFilm(),
                          CartButtonMore()
                        ],
                      ),
                    ),
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
