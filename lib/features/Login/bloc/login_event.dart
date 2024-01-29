part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SignUpButtonClicked extends LoginEvent{
  final String email;
  final String password;

  SignUpButtonClicked({required this.email, required this.password});
  
}

class NewHereClicked extends LoginEvent{}