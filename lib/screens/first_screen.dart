import 'package:bill_split/screens/second_screen.dart';
import 'package:bill_split/utilities/firstscreen_card_widget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

Future<bool> _exitApp(BuildContext context) {
  return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Do you want to exit this application?'),
          content: new Text('We hate to see you leave...'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitApp(context),
      child: Scaffold(
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
                        FirstCardWidget(
                          image: 'images/income.jpg',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SecondScreen()));
                          },
                        ),
                        FirstCardWidget(
                          image: 'images/investment.jpg',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SecondScreen()));
                          },
                        ),
                        FirstCardWidget(
                          image: 'images/debt.jpg',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SecondScreen()));
                          },
                        ),
                      ]),
                ),
              ],
            ),
          ]),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
                icon: Icons.account_balance_wallet_rounded, title: 'Balance'),
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.person_rounded, title: 'Gajendra Singh'),
          ],
          initialActiveIndex: 1,
          backgroundColor: Colors.black87,
        ),
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
