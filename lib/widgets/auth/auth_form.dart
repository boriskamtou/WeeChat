import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() {
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState.save();
      print(_userEmail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('useremail'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email address'),
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Please enter at least 4 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                  TextFormField(
                    key: ValueKey('userpassword'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password should be at least 7 character long';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userPassword = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin
                        ? 'Create new account'
                        : 'Already have an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
