import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_challege/ui/constants/colors.dart';

const String urlDefault =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ijvC2w2yANsfgLT3LMu2zFr0fxh.jpg";

class ProductionCastItem extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;

  const ProductionCastItem({
    Key? key,
    this.image = urlDefault,
    this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kAccentColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w300${image}',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              constraints: BoxConstraints(maxHeight: 15),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Text(
              description!,
              style: TextStyle(color: kAccentColor, fontSize: 10),
            ),
            SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
