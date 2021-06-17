import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/home/HomePage.dart';
import 'package:udemy_app/home/jobs/JobsPage.dart';
import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/services/database.dart';
import 'package:udemy_app/services/database.dart';



import 'package:udemy_app/sign_in/SignInUI.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            if (user == null) {
              return SignInUI.create(context);
            } else {
              return Provider<Database>(
                  create: (_) => FirestoreDatabase(uid: user.uid),
                  child: HomePage());
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
