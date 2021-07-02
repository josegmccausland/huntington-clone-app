import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:huntington_app_clone/bloc/auth_bloc.dart';
import 'package:huntington_app_clone/screens/pages/forgotPassword.dart';
import 'package:huntington_app_clone/screens/pages/forgotUsername.dart';
import 'package:huntington_app_clone/screens/pages/learnMore.dart';
import 'package:huntington_app_clone/screens/pages/logInForm/logInForm.dart';
import 'package:huntington_app_clone/screens/pages/logInSuccess.dart';
import 'package:huntington_app_clone/screens/pages/signUp.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  late final StreamSubscription _authBlocSubscription;

  void _authBlocListener(AuthState state) {
    if (state is UserLoadSuccess) {
      print('login success ${state.user}');
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoggedIn()));
    } else if (state is UserLoginFailure) {
      _showError(message: state.reason);
    }
  }

  /// Shows an error message in a material snack bar.
  void _showError({required String message}) {
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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/full-text-logoldpi.png'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: LoginForm(),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('New to Huntington?'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Learn More',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LearnMoreScreen()));
                                  },
                              ),
                              TextSpan(
                                text: ' or ',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Enroll Now',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    _launchURL(
                                        'https://selfservice.huntington.com/default/Enrollment/8');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
