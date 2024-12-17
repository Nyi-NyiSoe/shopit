abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}

class SignupEvent extends AuthEvent {
  final String username;
  final String password;

  SignupEvent({required this.username, required this.password});
}

class LogoutEvent extends AuthEvent {}