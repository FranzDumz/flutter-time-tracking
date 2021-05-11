import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      body: _buildContentSignInUI(),
    );
  }

  Widget _buildContentSignInUI() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 32.0),
            SignInButton(
              text: 'Sign in with Google',
              textColor: Colors.black87,
              color: Colors.white,
              onPressed: () {},
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Sign in with Facebook',
              textColor: Colors.white,
              color: Colors.blue[700],
              onPressed: () {},
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: 'Sign in with Email',
              textColor: Colors.white,
              color: Colors.red[300],
              onPressed: () {},
            ),
            SizedBox(height: 8.0),
            Text(
              'or',
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8.0),
            SignInButton(
              text: "Go Anonymo",
              textColor: Colors.white,
              color: Colors.grey[600],
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _signInWithGoogle() {
    //TODO: Auth with Google Account
  }
}
