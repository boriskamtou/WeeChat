import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = 'auth-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
