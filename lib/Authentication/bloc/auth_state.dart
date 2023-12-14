part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class Authenticated extends AuthState {}
final class NotAuthenticated extends AuthState {}
final class AuthFailure extends AuthState {
  String message;
  AuthFailure(this.message);
}
final class AuthLoading extends AuthState {}