import 'package:bill_split/utilities/database/core/database.dart';
import 'package:bill_split/utilities/database/modal/tabledata_modal.dart';
import 'package:bill_split/utilities/secondscreen_card_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int totalInvested = 0;
  int totalValue = 0;
  TextEditingController enterInvestmentName = new TextEditingController();
  TextEditingController enterInvestedValue = new TextEditingController();
  TextEditingController enterTotalValue = new TextEditingController();

  getData() async {
    // await DropdownTableDataDatabaseProvider.db.addDropdownTableDataToDatabase(
    //   new DropdownTableData(
    //     name: enterInvestmentName.text,
    //     invested: int.parse(enterInvestedValue.text),
    //     value: int.parse(enterTotalValue.text),
    //   ),
    // );
    var data =
        await DropdownTableDataDatabaseProvider.db.getAllDropdownTableData();
    data.forEach((row) => print(row.invested));

    data.forEach(
      (row) => dataRow1.add(
        DataRow(
          cells: <DataCell>[
            DataCell(
              Text(row.name),
            ),
            DataCell(Text(row.invested.toString())),
            DataCell(Text(row.value.toString())),
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
      ),
    );
    setState(() {
      updateSum(dataRow1);
    });

    print(data.length);
  }

  addDataRow(List<DataRow> dataRow, context, String cardname) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 275,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                      ),
                      controller: enterInvestmentName,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Investment"),
                      controller: enterInvestedValue,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Value"),
                      controller: enterTotalValue,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          await DropdownTableDataDatabaseProvider.db
                              .addDropdownTableDataToDatabase(
                            new DropdownTableData(
                              cardName: cardname,
                              name: enterInvestmentName.text,
                              invested: int.parse(enterInvestedValue.text),
                              value: int.parse(enterTotalValue.text),
                            ),
                          );
                          setState(() {
                            dataRow.add(
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Text(enterInvestmentName.text),
                                  ),
                                  DataCell(Text(enterInvestedValue.text)),
                                  DataCell(Text(enterTotalValue.text)),
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
                            updateSum(dataRow);
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  updateSum(List<DataRow> dataRow) {
    totalInvested = 0;
    totalValue = 0;
    for (int i = 0; i < dataRow.length; i++) {
      totalInvested = int.parse(dataRow[i]
              .cells[1]
              .child
              .toString()
              .replaceAll('Text("', '')
              .replaceAll('")', '')) +
          totalInvested;
      totalValue = int.parse(dataRow[i]
              .cells[2]
              .child
              .toString()
              .replaceAll('Text("', '')
              .replaceAll('")', '')) +
          totalValue;
    }
    enterInvestmentName = new TextEditingController();
    enterInvestedValue = new TextEditingController();
    enterTotalValue = new TextEditingController();
  }

  @override
  initState() {
    getData();
    super.initState();
  }

  List<DataRow> dataRow1 = [];
  List<DataRow> dataRow2 = [];
  List<DataRow> dataRow3 = [];

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
                        addDataRow(dataRow1, context, 'STOCKS');
                      },
                    ),
                    SecondCardWidget(
                      title: 'MUTUAL FUNDS',
                      investedValue: totalInvested.toString(),
                      currentValue: totalValue.toString(),
                      profitLoss:
                          (((totalValue - totalInvested) / totalInvested) * 100)
                              .toStringAsFixed(2),
                      onPressed: () {
                        addDataRow(dataRow2, context, 'MUTUAL FUNDS');
                      },
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
                      onPressed: () {
                        addDataRow(dataRow3, context, 'CRYPTO');
                      },
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
        onPressed: () async {
          await DropdownTableDataDatabaseProvider.db
              .dropTableIfExistsThenReCreate();
          setState(() {
            dataRow1 = [];
            dataRow2 = [];
            dataRow3 = [];
            updateSum(dataRow1);
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
