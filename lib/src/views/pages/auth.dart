import 'package:flutter/material.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn
}

class Auth extends StatelessWidget {
  const Auth(
      {Key key,
      @required this.loginState,
      @required this.email,
      @required this.startLoginFlow,
      @required this.verifyEmail,
      @required this.signInWithEmailAndPassword,
      @required this.registerAccount,
      @required this.signOut})
      : super(key: key);

  final ApplicationLoginState loginState;
  final String email;
  final void Function() startLoginFlow;
  final void Function(String email, void Function(Exception e) error)
      verifyEmail;
  final void Function(
          String email, String password, void Function(Exception e) error)
      signInWithEmailAndPassword;
  final void Function(String email, String password, String displayName,
      void Function(Exception e) error) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("some"),
    );
  }
}
