import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowAlertDialog.dart';
import 'package:udemy_app/home/account/Avatar.dart';
import 'package:udemy_app/services/Auth.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key key}) : super(key: key);


  Future<void> _signOutAnonymously(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    //TODO: Auth Anonymously
    try {
      await auth.signOut();
      print("Signed out");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOutAnonymously(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: _buildUserInfo(auth.currentUser),
        ),
        backgroundColor: Colors.brown[700],
      ),

    );
  }

  _buildUserInfo(User user) {

    return Column(
      children: <Widget>[
        Avatar(
          photoUrl: user.photoURL,
          radius: 50,
        ),
        SizedBox(height: 8,),
        if(user.displayName!=null)
          Text(user.displayName,style: TextStyle(color: Colors.white),)
      ],
    );
  }
}
