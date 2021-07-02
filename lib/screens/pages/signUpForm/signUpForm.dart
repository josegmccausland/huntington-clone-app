import 'package:flutter/material.dart' hide TextButton;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:huntington_app_clone/bloc/auth_bloc.dart';

/// Displays a sign up form that lets the user registers an account for the app.
class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final AuthBloc _authBloc;

  final _formKey = GlobalKey<FormState>();

  final _nameTextBoxController = TextEditingController();
  final _usernameTextBoxController = TextEditingController();
  final _emailTextBoxController = TextEditingController();
  final _passwordTextBoxController = TextEditingController();

  String get _userEmail => _emailTextBoxController.text;
  String get _userPassword => _passwordTextBoxController.text;
  String get _userDisplayName => _nameTextBoxController.text;
  String get _username => _usernameTextBoxController.text;

  void _signUpUser() {
    if (_formKey.currentState?.validate() == false) {
      return;
    }

    _authBloc.add(
      UserRegisteredWithEmail(
        email: _userEmail,
        username: _username,
        name: _userDisplayName,
        password: _userPassword,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _authBloc = AuthBloc.of(context, listen: false);
  }

  bool _obscureText = true;

  late String _password;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: _usernameTextBoxController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        // errorText: 'Please enter a valid username.',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: _nameTextBoxController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        // errorText: 'Please enter a valid username.',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                  ),
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
                          return 'Please enter a password.';
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
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).colorScheme.surface),
                          ),
                          onPressed: () {
                            final form = _formKey.currentState;
                            if (form!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Creating user...')));
                              _signUpUser();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'Sign Up',
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
