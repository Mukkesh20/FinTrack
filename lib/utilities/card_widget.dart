import 'package:bill_split/utilities/button_builder.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class CardWidget extends StatelessWidget {
  final title;
  final image;
  final onPressed;
  const CardWidget({this.title, this.image, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: kCardHeadingTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
