import 'package:flutter/material.dart';
import 'package:movies_challege/ui/components/card_button_mode.dart';
import 'package:movies_challege/ui/components/card_movie_item.dart';
import 'package:movies_challege/ui/components/title_list.dart';
import 'package:movies_challege/ui/components/view_page.dart';
import 'package:movies_challege/ui/constants/colors.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.white,
                  child: PageView(
                    /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                    /// Use [Axis.vertical] to scroll vertically.
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      print(value);
                    },
                    controller: controller,
                    children: <Widget>[
                      BannerViewPage(),
                      Center(
                        child: Text('First Page'),
                      ),
                      Center(
                        child: Text('Second Page'),
                      ),
                      Center(
                        child: Text('Third Page'),
                      )
                    ],
                  )),
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
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kAccentColor,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
