import 'package:flutter/material.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn
}

class Authentication extends StatelessWidget {
  const Authentication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("some"),
    );
  }
}
