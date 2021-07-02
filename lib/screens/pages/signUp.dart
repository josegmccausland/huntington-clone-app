import 'dart:async';

import 'package:flutter/material.dart';

import 'package:huntington_app_clone/bloc/auth_bloc.dart';
import 'package:huntington_app_clone/screens/homeScreen.dart';
import 'package:huntington_app_clone/screens/pages/learnMore.dart';
import 'package:huntington_app_clone/screens/pages/signUpForm/signUpForm.dart';

/// Displays the sign up page.
class SignUp extends StatefulWidget {
  const SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final StreamSubscription _authBlocSubscription;

  void _authBlocListener(AuthState state) {
    if (state is UserLoadSuccess) {
      print('user registered: ${state.user}');
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else if (state is UserRegistrationFailure) {
      _showError(state.reason);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
          // this width is defined in material design spec.
          width: 344,
        ),
      );
  }

  @override
  void initState() {
    super.initState();

    _authBlocSubscription =
        AuthBloc.of(context, listen: false).stream.listen(_authBlocListener);
  }

  @override
  void dispose() {
    _authBlocSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/full-text-logoldpi.png'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Container(
        child: SignUpForm(),
      ),
    );
  }
}
