import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowAlertDialog.dart';
import 'package:udemy_app/services/Auth.dart';


class HomePage extends StatelessWidget {


  Future<void> _signOutAnonymously(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context,listen: false);
    //TODO: Auth Anonymously
    try {
      await auth.signOut();
      print("Signed out");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await ShowAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if(didRequestSignOut == true){
      _signOutAnonymously(context);
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
                _confirmSignOut(context);
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
