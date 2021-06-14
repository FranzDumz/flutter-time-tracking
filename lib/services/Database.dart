import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:udemy_app/home/models/Job.dart';
import 'package:udemy_app/services/ApiPath.dart';
import 'package:udemy_app/services/FirestoreService.dart';

abstract class Database {
  Future<void> SetJob(Job job);

  Future<void> deleteJob(Job job);

  Stream<List<Job>> JobsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestroreDatabase implements Database {
  FirestroreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Future<void> SetJob(Job job) =>
      _service.setData(path: ApiPath.job(uid, job.id), data: job.toMap());

  @override
  Future<void> deleteJob(Job job) =>
      _service.deleteData(path: ApiPath.job(uid, job.id));

  @override
  Stream<List<Job>> JobsStream() => _service.collectionStream(
      path: ApiPath.jobs(uid),
      builder: (data, documentId) => Job.fromMap(data, documentId));
}
