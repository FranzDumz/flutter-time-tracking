import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/services/Auth.dart';
import 'package:udemy_app/sign_in/EmailSignInForm.dart';

import 'mocks.dart';

void main() {
  MockAuth mockAuth;
  setUp(() {
    mockAuth = MockAuth();
  });

  Future<void> pumpEmailSignInForm(WidgetTester tester,
      {VoidCallback onSignedIn}) async {
    await tester.pumpWidget(Provider<AuthBase>(
      create: (_) => mockAuth,
      child: MaterialApp(
        home: Scaffold(
          body: EmailSignInForm(
            onSignedIn: onSignedIn,
          ),
        ),
      ),
    ));
  }

  void stubSignInWithEmailAndPasswordSucceeds(){
    when(mockAuth.signInWithEmailAndPassword(any, any))
        .thenAnswer((_) => Future<User>.value(MockUser()));
  }

  void stubSignInWithEmailAndPasswordThrows(){
    when(mockAuth.signInWithEmailAndPassword(any, any))
        .thenThrow(FirebaseAuthException(code: 'Error_WRONG_PASSWORD'));

  }
  group('sign in', () {
    testWidgets(
        'When user doesnt enter email and password and user taps on the sign-in button then signInWithEmail and PAwssword is not called AND user is not signed in',
        (WidgetTester tester) async {
      var signedIn = false;
      await pumpEmailSignInForm(tester, onSignedIn: () => signedIn = true);
      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);

      verifyNever(mockAuth.signInWithEmailAndPassword(any, any));
      expect(signedIn, false);
    });
    testWidgets(
        'when user enters a valid email and password and user taps on the  sign-in button then signinwithemailandpassword is called AND user is signedIn',
        (WidgetTester tester) async {
      var signedIn = false;
      await pumpEmailSignInForm(tester, onSignedIn: () => signedIn = true);

      stubSignInWithEmailAndPasswordSucceeds();
      const email = 'email@email.com';
      const password = 'password';

      final emailField = find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      await tester.pump();

      final signInButton = find.text('Sign In');
      await tester.tap(signInButton);

      verify(mockAuth.signInWithEmailAndPassword(email, password)).called(1);
      expect(signedIn, true);
    });
    testWidgets(
        'when user enters an invalid email and password and user taps on the  sign-in button then signinwithemailandpassword is called AND user is not signedIn',
            (WidgetTester tester) async {
          var signedIn = false;
          await pumpEmailSignInForm(tester, onSignedIn: () => signedIn = true);

          stubSignInWithEmailAndPasswordThrows();
          const email = 'email@email.com';
          const password = 'password';

          final emailField = find.byKey(Key('email'));
          expect(emailField, findsOneWidget);
          await tester.enterText(emailField, email);

          final passwordField = find.byKey(Key('password'));
          expect(passwordField, findsOneWidget);
          await tester.enterText(passwordField, password);

          await tester.pump();

          final signInButton = find.text('Sign In');
          await tester.tap(signInButton);

          verify(mockAuth.signInWithEmailAndPassword(email, password)).called(1);
          expect(signedIn, false);
        });
  });

  group('register', () {
    testWidgets(
        'when user taps on the secondary button THEN form toggles to registration mode',
        (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);
      final registerButton = find.text('Need an account? Register');
      await tester.tap(registerButton);
      await tester.pump();

      final createAccountButton = find.text('Create an account');

      expect(createAccountButton, findsOneWidget);
    });
    testWidgets(
        'when user taps on  the secondary button AND user enters the email and password AND user taps on the  register  button THEN  createuserwithEmailAndPassword is called',
        (WidgetTester tester) async {
      await pumpEmailSignInForm(tester);

      const email = 'email@email.com';
      const password = 'password';

      final registerButton = find.text('Need an account? Register');
      await tester.tap(registerButton);
      await tester.pump();

      final emailField = find.byKey(Key('email'));
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byKey(Key('password'));
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      await tester.pump();

      final createAccountButton = find.text('Create an account');
      expect(createAccountButton, findsOneWidget);
      await tester.tap(createAccountButton);

      verify(mockAuth.createUserWithEmailAndPassword(email, password))
          .called(1);
    });
  });
}
