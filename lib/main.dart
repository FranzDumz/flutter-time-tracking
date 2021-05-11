import 'package:flutter/material.dart';
import 'package:udemy_app/sign_in/SignInUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.brown), home: SignIn());
  }
}
