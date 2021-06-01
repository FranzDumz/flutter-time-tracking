import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/common_widgets/ShowExceptionAlertDialog.dart';
import 'package:udemy_app/services/Auth.dart';

import 'package:udemy_app/sign_in/EmailSignInPage.dart';
import 'package:udemy_app/sign_in/SignInBloc.dart';
import 'package:udemy_app/sign_in/SignInButton.dart';

class SignInUI extends StatelessWidget {
  final SignInBloc bloc;
  const SignInUI({Key key, @required this.bloc}) : super(key: key);

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc, __) => SignInUI(bloc: bloc),
      ),
    );
  }


  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'Error_aborted_by_user') {
      return;
    }
    ShowExceptionAlertDialog(context,
        title: 'Sign in Failed', exception: exception);
  }

  Future<void> _signInAnonymously(BuildContext context) async {

    //TODO: Auth Anonymously
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {}
  }

  Future<void> _signInWithGoogle(BuildContext context) async {

    //TODO: Auth with Google Account
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {}
  }

  Future<void> _signInWithFacebook(BuildContext context) async {

    //TODO: Auth with Email
    try {
      await bloc.signInWithFacebook();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {}
  }

  Future<void> _signInWithEmail(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    //TODO: Auth with Google Account
    Navigator.of(context).push(MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignIn(
              auth: auth,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context, snapshot) {
            return _buildContentSignInUI(context, snapshot.data);
          }),
    );
  }

  Widget _buildContentSignInUI(BuildContext context, bool isLoading) {
    return Container(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Center(
            child: NotificationListener<OverscrollIndicatorNotification>(
              // ignore: missing_return
              onNotification: (overscroll) {
                overscroll.disallowGlow();
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(isLoading),
                    SizedBox(height: 8.0),
                    Text(
                      'Keep record of your time',
                      style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 98.0),
                    SignInButton(
                      imagepath: 'images/google-logo.png',
                      text: 'Sign in with google',
                      color: Colors.white,
                      textColor: Colors.black,
                      onPressed:
                          isLoading ? null : () => _signInWithGoogle(context),
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/facebook-logo.png',
                      text: 'Sign in with facebook',
                      color: Colors.blue[700],
                      textColor: Colors.white,
                      onPressed:
                          isLoading ? null : () => _signInWithFacebook(context),
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/email.png',
                      text: 'Sign in with Email',
                      color: Colors.brown[400],
                      textColor: Colors.white,
                      onPressed: () {
                        _signInWithEmail(context);
                      },
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'or',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 8.0),
                    SignInButton(
                      imagepath: 'images/ghost.png',
                      text: 'Go Anonymous',
                      color: Colors.grey[700],
                      textColor: Colors.white,
                      onPressed:
                          isLoading ? null : () => _signInAnonymously(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Updraft',
      style: TextStyle(
          color: Colors.brown[700],
          fontSize: 62.0,
          fontWeight: FontWeight.w900),
    );
  }
}
