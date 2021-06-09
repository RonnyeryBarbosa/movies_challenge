import 'package:flutter/cupertino.dart';

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
        ],
      ),
    );
  }
}
