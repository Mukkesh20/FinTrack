import 'package:bill_split/screens/first_screen.dart';
import 'package:bill_split/utilities/contants.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
        appBar: kAppBar,
        body: LoginPage(),
        bottomNavigationBar: kBottomNavyBar,
      ),
    );
  }
}
