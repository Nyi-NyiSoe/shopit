import 'package:shopit/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess({required this.user});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
