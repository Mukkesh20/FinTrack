import 'package:bill_split/utilities/button_builder.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:flutter/material.dart';

import 'screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Colors.teal,
          title: Text('FinTrack'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: FlatButton(
                child: Row(
                  children: [
                    Text('Login'),
                    Icon(
                      Icons.login_outlined,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: LoginPage(),
        //bottomNavigationBar: kBottomNavyBar,
      ),
    );
  }
}
