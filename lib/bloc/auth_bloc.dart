import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// A Bloc that handles user-related logic, including login and registration.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial());

  /// Retrieves the instance of [AuthBloc] from [context].
  /// Shorthand for `BlocProvider.of<AuthBloc>()`
  static AuthBloc of(BuildContext context, {bool listen = true}) =>
      BlocProvider.of(
        context,
        listen: listen,
      );

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is UserRegisteredWithEmail) {
      yield* _registerUserWithEmail(
          event.username, event.name, event.email, event.password);
    } else if (event is UserLoggedInWithEmail) {
      yield* _logUserInWithEmail(event.email, event.password);
    }
  }

  /// Sets login persistence based on whether the user wants the app
  /// to remember their login details.

  Stream<AuthState> _registerUserWithEmail(
      String username, String name, String email, String password) async* {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('firebase user created');

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        yield const UserRegistrationFailure();
        return;
      }

      await user.updateDisplayName(
        name,
      );

      print('firebase user display name set');

      await user.sendEmailVerification();

      print('Email verification sent.');
      yield UserLoadSuccess(user);
    } on FirebaseAuthException catch (ex) {
      yield UserRegistrationFailure(reason: ex.code);
    } on Exception catch (ex) {
      print('ex $ex');
      yield const UserRegistrationFailure();
    }
  }

  Stream<AuthState> _logUserInWithEmail(String email, String password) async* {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('logging in...');
      final user = FirebaseAuth.instance.currentUser;
      print(user);
      if (user == null) {
        print('firebase auth exception');
        yield UserLoginFailure(reason: 'failed to sign in.');
      } else {
        yield UserLoadSuccess(user);
      }
    } on FirebaseAuthException catch (ex) {
      print('firebase auth exception $ex');
      yield UserLoginFailure(reason: ex.code);
    } on Exception {
      yield const UserLoginFailure();
    }
  }
}
