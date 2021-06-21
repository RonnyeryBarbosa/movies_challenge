import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/movie.dart';
import 'package:movies_challege/ui/constants/colors.dart';

class BannerViewPage extends StatelessWidget {
  Movie? movie;
  BannerViewPage({Key? key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/w500${movie!.banner!}',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: 140,
            left: 70,
            child: Text(
              movie!.title ?? movie!.name!,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 180,
            left: 70,
            child: Container(
              padding: EdgeInsets.only(left: 4, right: 4),
              decoration: BoxDecoration(
                color: kTransparenceColor,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                child: Text(
                  "Ver Mais",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print("Ver mais");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
