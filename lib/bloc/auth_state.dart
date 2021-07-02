part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class UserAuthenticationSuccess extends AuthState {
  /// ID token is retrieved from the firebase user object.
  final String idToken;

  const UserAuthenticationSuccess({required this.idToken});
}

class UserRegistrationFailure extends AuthState {
  final String reason;

  const UserRegistrationFailure({
    this.reason =
        'An unknown error has occurred when trying to create your account.',
  });
}

class UserLoginFailure extends AuthState {
  final String reason;

  const UserLoginFailure({
    this.reason = 'An unknown error has occurred when trying to log you in.',
  });
}

class UserLoginSuccess extends AuthState {
  const UserLoginSuccess();
}

class UserLoadSuccess extends AuthState {
  /// The current [User] object.
  final User user;

  const UserLoadSuccess(this.user);
}
