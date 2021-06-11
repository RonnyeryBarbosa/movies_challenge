import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_challege/ui/constants/colors.dart';

class BannerViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ijvC2w2yANsfgLT3LMu2zFr0fxh.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            top: 140,
            left: 70,
            child: Text(
              "Black Middow",
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
