import 'package:bill_split/utilities/contants.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class FirstCardWidget extends StatelessWidget {
  final image;
  final onPressed;
  const FirstCardWidget({this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
