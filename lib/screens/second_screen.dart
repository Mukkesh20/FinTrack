import 'package:bill_split/utilities/popup_form_datatable.dart';
import 'package:bill_split/utilities/secondscreen_card_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int totalInvested = 0;
  int totalValue = 0;

  @override
  initState() {
    super.initState();
    totalInvested = 0;
    totalValue = 0;
    for (int i = 0; i < dataRow1.length; i++) {
      totalInvested = int.parse(dataRow1[i]
              .cells[1]
              .child
              .toString()
              .replaceAll('Text("', '')
              .replaceAll('")', '')) +
          totalInvested;
      totalValue = int.parse(dataRow1[i]
              .cells[2]
              .child
              .toString()
              .replaceAll('Text("', '')
              .replaceAll('")', '')) +
          totalValue;
    }
  }

  List<DataRow> dataRow1 = [
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('Tata Motors'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5200')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('IT ETF'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5800')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
  ];

  List<DataRow> dataRow2 = [
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('Tata Motors'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5200')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('IT ETF'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5800')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
  ];

  List<DataRow> dataRow3 = [
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('Tata Motors'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5200')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(
          Text('IT ETF'),
        ),
        DataCell(Text('5000')),
        DataCell(Text('5800')),
        DataCell(
          Icon(Icons.edit),
        ),
        DataCell(
          Icon(
            Icons.close_rounded,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.black87,
        title: Text(
          'FinTrack',
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FlatButton(
              child: Row(
                children: [
                  Text(
                    'Logout',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.black],
          ),
        ),
        child: ListView(children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SecondCardWidget(
                      title: 'STOCKS',
                      investedValue: totalInvested.toString(),
                      currentValue: totalValue.toString(),
                      profitLoss:
                          (((totalValue - totalInvested) / totalInvested) * 100)
                              .toStringAsFixed(2),
                      dataRow: dataRow1,
                      onPressed: () {
                        setState(() {
                          dataRow1.add(
                            DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Text('Sarah'),
                                ),
                                DataCell(Text('10000')),
                                DataCell(Text('12000')),
                                DataCell(
                                  Icon(Icons.edit),
                                ),
                                DataCell(
                                  Icon(
                                    Icons.close_rounded,
                                  ),
                                ),
                              ],
                            ),
                          );
                          totalInvested = 0;
                          totalValue = 0;
                          for (int i = 0; i < dataRow1.length; i++) {
                            totalInvested = int.parse(dataRow1[i]
                                    .cells[1]
                                    .child
                                    .toString()
                                    .replaceAll('Text("', '')
                                    .replaceAll('")', '')) +
                                totalInvested;
                            totalValue = int.parse(dataRow1[i]
                                    .cells[2]
                                    .child
                                    .toString()
                                    .replaceAll('Text("', '')
                                    .replaceAll('")', '')) +
                                totalValue;
                          }
                          print(totalInvested);
                        });
                      },
                    ),
                    SecondCardWidget(
                      title: 'MUTUAL FUNDS',
                      investedValue: totalInvested.toString(),
                      currentValue: totalValue.toString(),
                      profitLoss:
                          (((totalValue - totalInvested) / totalInvested) * 100)
                              .toStringAsFixed(2),
                      dataRow: dataRow2,
                    ),
                    SecondCardWidget(
                      title: 'CRYPTO',
                      investedValue: totalInvested.toString(),
                      currentValue: totalValue.toString(),
                      profitLoss:
                          (((totalValue - totalInvested) / totalInvested) * 100)
                              .toStringAsFixed(2),
                      dataRow: dataRow3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.account_balance_wallet_rounded, title: 'Balance'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.person_rounded, title: 'Gajendra Singh'),
        ],
        initialActiveIndex: 1,
        backgroundColor: Colors.black87,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          setState(() {
            dataRow1.add(
              DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text('Sarah'),
                  ),
                  DataCell(Text('100')),
                  DataCell(Text('120')),
                  DataCell(
                    Icon(Icons.edit),
                  ),
                  DataCell(
                    Icon(
                      Icons.close_rounded,
                    ),
                  ),
                ],
              ),
            );
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// CircleAvatar(
// backgroundImage: NetworkImage(
// imageUrl,
// ),
// radius: 60,
// backgroundColor: Colors.transparent,
// ),
// SizedBox(height: 40),
// Text(
// 'NAME',
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold,
// color: Colors.black54),
// ),
// Text(
// name,
// style: TextStyle(
// fontSize: 25,
// color: Colors.deepPurple,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(height: 20),
// Text(
// 'EMAIL',
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold,
// color: Colors.black54),
// ),
// Text(
// email,
// style: TextStyle(
// fontSize: 25,
// color: Colors.deepPurple,
// fontWeight: FontWeight.bold),
// ),
// SizedBox(height: 40),
// RaisedButton(
// onPressed: () {
// signOutGoogle();
// Navigator.of(context).pushAndRemoveUntil(
// MaterialPageRoute(builder: (context) {
// return LoginPage();
// }), ModalRoute.withName('/'));
// },
// color: Colors.deepPurple,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'Sign Out',
// style: TextStyle(fontSize: 25, color: Colors.white),
// ),
// ),
// elevation: 5,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(40),
// ),
// ),
