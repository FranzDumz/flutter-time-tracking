import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:udemy_app/services/Auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth, @required this.isLoading});
  final ValueNotifier<bool> isLoading;

  final AuthBase auth;


  Future<User> _signIn(Future<User> Function() signInMethod ) async{
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInAnonymously() async =>
    await _signIn(auth.signInAnonymously);


  Future<User> signInWithFacebook()  async =>
      await _signIn(auth.signInWithFacebook);

  Future<User> signInWithGoogle()  async =>
      await _signIn(auth.signInWithGoogle);
}
