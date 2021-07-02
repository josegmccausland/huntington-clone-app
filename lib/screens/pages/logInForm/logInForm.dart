import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huntington_app_clone/bloc/auth_bloc.dart';
import 'package:huntington_app_clone/screens/pages/forgotPassword.dart';
import 'package:huntington_app_clone/screens/pages/forgotUsername.dart';

/// Displays a login form that let users login to the app.
class LoginForm extends StatefulWidget {
  const LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final AuthBloc _authBloc;
  late final StreamSubscription _authBlocSubscription;

  bool _isFormEnabled = true;

  final _formKey = GlobalKey<FormState>();
  final _emailTextBoxController = TextEditingController();
  final _passwordTextBoxController = TextEditingController();

  bool _obscureText = true;

  late String _password;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Retrieves the email the user has inputted in the email box.
  String get _userEmail => _emailTextBoxController.text;

  /// Retrieves the password the user has inputted in the password box.
  String get _userPassword => _passwordTextBoxController.text;

  void _authBlocListener(AuthState state) {
    if (state is UserLoginFailure) {
      setState(() {
        _isFormEnabled = true;
      });
    }
  }

  void _showLoadingState() {
    setState(() {
      _isFormEnabled = false;
    });
  }

  void _loginWithEmail() {
    if (_formKey.currentState?.validate() == true) {
      _showLoadingState();
      _authBloc.add(
        UserLoggedInWithEmail(
          email: _userEmail,
          password: _userPassword,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _authBloc = AuthBloc.of(context, listen: false);
    _authBlocSubscription = _authBloc.stream.listen(_authBlocListener);
  }

  @override
  void dispose() {
    _authBlocSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              controller: _emailTextBoxController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                // errorText: 'Please enter a valid username.',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              controller: _passwordTextBoxController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                // errorText: 'Please enter a valid password.',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.';
                }
                return null;
              },
              onSaved: (val) => _password = val!,
              obscureText: _obscureText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    InkWell(
                      child: Text('Forgot Username?'),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotUsernameScreen()))
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Text('Forgot Password?'),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()))
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/quick-balancemdpi.png'),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.surface),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Logging in...')));
                      _loginWithEmail();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Apex New',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
