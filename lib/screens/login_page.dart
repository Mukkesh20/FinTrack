import '../screens/first_screen.dart';
import '../services/auth-service/google_signin.dart';
import 'package:flutter/material.dart';
import '../utilities/button_builder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              roundButton(
                onPressed: () {
                  signInWithGoogle().then((result) {
                    if (result != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen();
                          },
                        ),
                      );
                    }
                  });
                },
                buttonText: 'Sign in with Google',
                buttonIcon: Image(
                    image: AssetImage("assets/google_logo.png"), height: 35.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
