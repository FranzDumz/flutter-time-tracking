import 'package:flutter/material.dart';
import 'package:udemy_app/common_widgets/customRaisedButton.dart';
import 'package:udemy_app/sign_in/SignInButton.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _buildContentSignInUI(),
    );
  }

  Widget _buildContentSignInUI() {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Center(
            child: NotificationListener<OverscrollIndicatorNotification>(
              // ignore: missing_return
              onNotification: (overscroll) {
                overscroll.disallowGlow();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Updraft',
                      style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: 62.0,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Keep record of your time',
                      style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 98.0),
                    SignInButton(
                      imagepath: 'images/google-logo.png',
                      text: 'Sign in with google',
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed: () {},
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/facebook-logo.png',
                      text: 'Sign in with facebook',
                      color: Colors.blue[700],
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/email.png',
                      text: 'Sign in with Email',
                      color: Colors.brown[400],
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'or',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/ghost.png',
                      text: 'Go Anonymous',
                      color: Colors.grey[700],
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signInWithGoogle() {
    //TODO: Auth with Google Account
  }
}
