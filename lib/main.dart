import 'package:bill_split/screens/first_screen.dart';
import 'package:bill_split/services/auth-service/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        body: FutureBuilder<GoogleSignIn>(
            future: signInWithGoogle().then((value) => null),
            builder:
                (BuildContext context, AsyncSnapshot<GoogleSignIn> snapshot) {
              if (snapshot.hasData) {
                print('has data');
                return FirstScreen();
              } else {
                print(snapshot.data);
                return LoginPage();
              }
            }),
      ),
    );
  }
}

//
// MaterialApp(
// home: Scaffold(
// appBar: AppBar(
// leading: Icon(Icons.menu),
// backgroundColor: Colors.teal,
// title: Text('FinTrack'),
// // actions: [
// //   Padding(
// //     padding: EdgeInsets.symmetric(horizontal: 16),
// //     child: FlatButton(
// //       child: Row(
// //         children: [
// //           Text('Login'),
// //           Icon(
// //             Icons.login_outlined,
// //           ),
// //         ],
// //       ),
// //       onPressed: () {
// //         signInWithGoogle().then((result) {
// //           if (result != null) {
// //             Navigator.of(context).push(
// //               MaterialPageRoute(
// //                 builder: (context) {
// //                   return FirstScreen();
// //                 },
// //               ),
// //             );
// //           }
// //         });
// //       },
// //     ),
// //   ),
// // ],
// ),
// body: googleSignIn.currentUser != null
// ? Navigator.of(context).push(
// MaterialPageRoute(
// builder: (context) {
// return FirstScreen();
// },
// ),
// )
// : LoginPage()
// //bottomNavigationBar: kBottomNavyBar,
// ),
// );
// }
