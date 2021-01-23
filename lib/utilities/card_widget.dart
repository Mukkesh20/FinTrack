import 'package:bill_split/utilities/button_builder.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class CardWidget extends StatelessWidget {
  final title;
  final onPressed;
  const CardWidget({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
      elevation: 5.0,
      clipBehavior: Clip.antiAlias,
      child: FlatButton(
        padding: EdgeInsets.all(1),
        onPressed: onPressed,
        child: GradientCard(
          gradient: Gradients.blush,
          shadowColor: Gradients.cosmicFusion.colors.last.withOpacity(1),
          elevation: 2,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: kCardHeadingTextStyle,
                ),
                subtitle: Text(
                  'Secondary Text',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Image.asset(
                'assets/google_logo.png',
                scale: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
