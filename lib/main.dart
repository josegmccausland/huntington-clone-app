import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huntington_app_clone/bloc/auth_bloc.dart';
import 'package:huntington_app_clone/screens/homeScreen.dart';
import 'package:huntington_app_clone/utils/createMaterialColor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Text('something is wrong.'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocProvider(
            create: (BuildContext context) => AuthBloc(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: Brightness.light,
                colorScheme: ColorScheme.fromSwatch(
                  brightness: Brightness.light,
                  primarySwatch: createMaterialColor(Color(0xff5ba63c)),
                ).copyWith(
                  surface: createMaterialColor(Color(0xff394048)),
                  secondary: createMaterialColor(Color(0xffaad52d)),
                ),
              ),
              home: HomeScreen(),
            ),
          );
        }

        return MaterialApp(
          title: 'Huntington Clone App',
          home: HomeScreen(),
        );
      },
    );
  }
}
