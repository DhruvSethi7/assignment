part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  String email;
  String password;
  LoginEvent(this.email,this.password);
}

final class LogoutEvent extends AuthEvent {}

final class SignUpEvent extends AuthEvent{
  String displayName;
  String email;
  String password;
  SignUpEvent(this.displayName,this.email,this.password);
}