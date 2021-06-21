import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_challege/data/model/cast.dart';

class InfoGeralItem extends Container {
  final Cast? data;

  InfoGeralItem({@required this.data});

  @override
  Widget? get child => Center(
          child: Row(
        children: [
          Text(data?.name ?? ""),
          Text(data?.character ?? ""),
        ],
      ));

  @override
  Decoration? get decoration => BoxDecoration(
      color: Colors.brown.withOpacity(0.3),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}
