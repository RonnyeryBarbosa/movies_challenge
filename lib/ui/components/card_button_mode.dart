import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartButtonMore extends StatelessWidget {
  var action;

  CartButtonMore({this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: MediaQuery.of(context).size.width * 0.25,
          child: Center(
              child: Row(
            children: [
              Flexible(
                flex: 2,
                child: FittedBox(child: Text('Ver mais')),
              ),
              Flexible(child: Icon(Icons.navigate_next)),
            ],
          )),
        ));
  }
}
