import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String urlDefault =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ijvC2w2yANsfgLT3LMu2zFr0fxh.jpg";

class CardMovieFilm extends StatelessWidget {
  final String? image;

  const CardMovieFilm({Key? key, this.image = urlDefault}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image!,
          height: 15,
          width: MediaQuery.of(context).size.width * 0.17,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
