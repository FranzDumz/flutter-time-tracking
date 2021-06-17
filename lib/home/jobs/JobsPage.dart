import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowAlertDialog.dart';
import 'package:udemy_app/common_widgets/ShowExceptionAlertDialog.dart';
import 'package:udemy_app/home/job_entries/job_entries_page.dart';
import 'package:udemy_app/home/jobs/AddEditJobPage.dart';
import 'package:udemy_app/home/jobs/EmptyContent.dart';
import 'package:udemy_app/home/jobs/JobListTile.dart';
import 'package:udemy_app/home/jobs/ListItemBuilder.dart';
import 'package:udemy_app/home/models/Job.dart';
import 'package:udemy_app/services/Auth.dart';

import 'package:udemy_app/services/database.dart';

class JobsPage extends StatelessWidget {


  Future<void> _delete(BuildContext context, Job job) async {
    try {
      final database = Provider.of<Database>(context, listen: false);
      await database.deleteJob(job);
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
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => AddEditJobPage.show(context,
                database: Provider.of<Database>(context, listen: false)),
          ),
        ],
        backgroundColor: Colors.brown[700],
      ),
      body: _buildContents(context),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Job>>(
      stream: database.jobsStream(),
      builder: (context, snapshot) {
        return ListItemBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) => Dismissible(
                  key: Key('job-${job.id}'),
                  background: Container(
                    color: Colors.red,
                  ),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) => _delete(context, job),
                  child: JobListTile(
                    job: job,
                    onTap: () => JobEntriesPage.show(context, job),
                  ),
                ));
      },
    );
  }
}
