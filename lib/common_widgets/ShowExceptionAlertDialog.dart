

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'ShowAlertDialog.dart';

Future<void> ShowExceptionAlertDialog(
  BuildContext context, {
  @required String title,
  @required Exception exception,
}) =>
    ShowAlertDialog(context,
        title: title, content: _message(exception), defaultActionText: 'OK');

String _message(Exception exception) {
  if (exception is FirebaseException) {
    return exception.message;
  }
  return exception.toString();
}
