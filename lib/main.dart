import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/landing_page/LandingPage.dart';
import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/services/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.brown),
          home: LandingPage(
            databaseBuilder: (uid) => FirestoreDatabase(uid: uid),
          )),
    );
  }
}
