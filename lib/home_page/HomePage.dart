
import 'package:flutter/material.dart';
import 'package:udemy_app/services/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key,@required this.auth}) : super(key: key);
  final AuthBase auth;


  Future<void> _signOutAnonymously() async {
    //TODO: Auth Anonymously
    try {
      await auth.signOut();
      print("Signed out");
    } catch (e) {
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updraft'),
        titleTextStyle: TextStyle(color: Colors.white),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                _signOutAnonymously();
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ))
        ],
        backgroundColor: Colors.brown[700],
      ),
      body: Container(
        color: Colors.white60,
        child: Column(
          children: [Text('')],
        ),
      ),
    );
  }
}
