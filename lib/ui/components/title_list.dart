import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleList extends Container {
  var title;

  TitleList({this.title});

  @override
  EdgeInsetsGeometry? get margin => EdgeInsets.only(
        left: 20,
        bottom: 20,
        top: 20,
      );

  @override
  Widget? get child => Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      );
}
