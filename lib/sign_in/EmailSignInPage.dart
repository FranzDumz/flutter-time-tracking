import 'package:flutter/material.dart';
import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/sign_in/EmailSignInForm.dart';

class EmailSignIn extends StatelessWidget {
  EmailSignIn({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with email'),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.brown[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: EmailSignInForm(),
          ),
        ),
      ),
    );
  }
}


