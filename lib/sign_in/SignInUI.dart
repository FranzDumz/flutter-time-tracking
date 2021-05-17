import 'package:flutter/material.dart';

import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/sign_in/SignInButton.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    //TODO: Auth Anonymously
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    //TODO: Auth with Google Account
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    //TODO: Auth with Google Account
    try {
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

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
                      onPressed: _signInWithGoogle,
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/facebook-logo.png',
                      text: 'Sign in with facebook',
                      color: Colors.blue[700],
                      textColor: Colors.white,
                      onPressed: _signInWithFacebook,
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
                      onPressed: _signInAnonymously,
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
}
