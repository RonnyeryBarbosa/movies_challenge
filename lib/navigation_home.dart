import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_challege/ui/screens/favorites/favorites_view.dart';
import 'package:movies_challege/ui/screens/home/home_view.dart';
import 'package:movies_challege/ui/constants/colors.dart';
import 'package:movies_challege/ui/screens/series/series_view.dart';

class NavigationHomeView extends StatefulWidget {
  @override
  _NavigationHomeViewState createState() => _NavigationHomeViewState();
}

class _NavigationHomeViewState extends State<NavigationHomeView> {
  int _page = 0;

  final List<Widget> _screens = [HomeView(), SeriesView(), FavoritesView()];

  onTabTapped(int index) {
    print(index);
    // print(_index);
    // setState(() {
    //   _index = index;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/theater.svg",
                  color: isSelected(_page == 0),
                ),
                label: "Filmes",
                backgroundColor: kPrimaryColor),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/television.svg",
                color: isSelected(_page == 1),
              ),
              label: "Series",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/heart_outline.svg",
                color: isSelected(_page == 2),
              ),
              label: "Favoritos",
            ),
          ],
          selectedItemColor: kPrimaryColor),
    );
  }

  Color isSelected(bool currentPage) {
    return currentPage == true ? kAccentColor : kPrimaryColor;
  }

  void onTapped(index) {
    setState(() {
      _page = index;
    });
    print("dadsa");
  }
}
