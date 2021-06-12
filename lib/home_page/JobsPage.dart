import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowAlertDialog.dart';
import 'package:udemy_app/common_widgets/ShowExceptionAlertDialog.dart';
import 'package:udemy_app/models/Job.dart';
import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/services/Database.dart';

class JobsPage extends StatelessWidget {
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

  Future<void> _createJob(BuildContext context) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.createJob(Job(name: 'Blogging', ratePerHour: 10));
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(context,
          title: 'Operation Failed', exception: e);
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
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createJob(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.JobsStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final jobs = snapshot.data;
          final children = jobs.map((job) => Text(job.name)).toList();
          return ListView(
            children: children,
          );
        }
        if(snapshot.hasError){
          return Center(child: Text('Some error occureed'),);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
