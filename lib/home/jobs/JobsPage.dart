import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowAlertDialog.dart';
import 'package:udemy_app/common_widgets/ShowExceptionAlertDialog.dart';
import 'package:udemy_app/home/jobs/AddEditJobPage.dart';
import 'package:udemy_app/home/jobs/EmptyContent.dart';
import 'package:udemy_app/home/jobs/JobListTile.dart';
import 'package:udemy_app/home/jobs/ListItemBuilder.dart';
import 'package:udemy_app/home/models/Job.dart';
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

  Future<void> _delete(BuildContext context, Job job) async{
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
    }on FirebaseException catch(e){
      showExceptionAlertDialog(context, title: 'Operation Failed', exception: e);
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
        onPressed: () => AddEditJobPage.show(context),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.JobsStream(),
      builder: (context, snapshot) {
        return ListItemBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) => Dismissible(
              key: Key('job-${job.id}'),
              background: Container(color: Colors.red,),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) => _delete(context,job),
              child: JobListTile(
                    job: job,
                    onTap: () => AddEditJobPage.show(context, job: job),
                  ),
            ));
      },
    );
  }


}
