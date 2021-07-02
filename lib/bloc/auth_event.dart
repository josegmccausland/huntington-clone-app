part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class UserLoggedInWithEmail extends AuthEvent {
  final String email;
  final String password;

  const UserLoggedInWithEmail({
    required this.email,
    required this.password,
  });
}

class UserRegisteredWithEmail extends AuthEvent {
  final String username;
  final String name;
  final String email;
  final String password;

  const UserRegisteredWithEmail({
    required this.username,
    required this.name,
    required this.email,
    required this.password,
  });
}
