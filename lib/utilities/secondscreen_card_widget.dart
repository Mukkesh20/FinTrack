import 'dart:ui';

import 'package:bill_split/utilities/button_builder.dart';
import 'package:bill_split/utilities/popup_form_datatable.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class SecondCardWidget extends StatelessWidget {
  final title;
  final onPressed;
  final investment;
  final dataRow;
  final investedValue;
  final currentValue;
  final profitLoss;
  const SecondCardWidget(
      {this.title,
      this.investment,
      this.dataRow,
      this.onPressed,
      this.investedValue,
      this.currentValue,
      this.profitLoss});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w800,
                  fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Invested ',
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        investedValue,
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Value',
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        currentValue,
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Profit/Loss',
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        profitLoss,
                        style: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: ExpansionTile(
              title: Text(
                'Details',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                textAlign: TextAlign.center,
              ),
              children: [
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Investment',
                        textAlign: TextAlign.center,
                      ),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text(
                        'Value',
                        textAlign: TextAlign.center,
                      ),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text(''),
                    ),
                    DataColumn(
                      label: Text(''),
                    ),
                  ],
                  rows: dataRow,
                  columnSpacing: 30.0,
                  horizontalMargin: 20.0,
                  sortColumnIndex: 0,
                  sortAscending: true,
                ),
                FlatButton(
                  child: Icon(Icons.add),
                  onPressed: onPressed,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
