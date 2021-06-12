import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_app/models/Job.dart';
import 'package:udemy_app/services/ApiPath.dart';
import 'package:udemy_app/services/FirestoreService.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> JobsStream();
}

class FirestroreDatabase implements Database {
  FirestroreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) =>
      _service.setData(path: ApiPath.job(uid, 'job_abc'), data: job.toMap());

  Stream<List<Job>> JobsStream() => _service.collectionStream(
      path: ApiPath.jobs(uid), builder: (data) => Job.fromMap(data));
}
