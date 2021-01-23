import 'package:bill_split/screens/second_screen.dart';
import 'package:bill_split/utilities/card_widget.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Widget> mainCard = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black87],
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
                  children: mainCard,
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
        ],
        initialActiveIndex: 0, //optional, default as 0
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          setState(() {
            mainCard.add(MainCardWidget());
          });
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class MainCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      title: 'Hello',
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => SecondScreen()));
      },
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
