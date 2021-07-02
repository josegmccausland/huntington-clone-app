import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:huntington_app_clone/screens/homeScreen.dart';

class LoggedIn extends StatefulWidget {
  const LoggedIn();

  @override
  _LoggedInState createState() => _LoggedInState();
}

class _LoggedInState extends State<LoggedIn> {
  void _logOut() async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // scaffoldMessenger.showSnackBar(messageSnackBar('Logging you out...'));
    await FirebaseAuth.instance.signOut();
    scaffoldMessenger.removeCurrentSnackBar();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Column(
            children: [
              Text(
                'You have Successfully signed in!',
                style: TextStyle(
                  fontFamily: 'Apex New',
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/success.gif"),
              ElevatedButton(
                onPressed: _logOut,
                child: Text('Log Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
