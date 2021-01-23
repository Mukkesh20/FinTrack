import 'package:bill_split/utilities/card_widget.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
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
                    CardWidget(
                      title: 'Whatsupp',
                    ),
                    CardWidget(
                      title: 'Whatsupp',
                    ),
                    CardWidget(
                      title: 'Whatsupp',
                    ),
                    CardWidget(
                      title: 'Whatsupp',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
      bottomNavigationBar: kBottomNavyBar,
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
