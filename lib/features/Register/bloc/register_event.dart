part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterButtonClicked extends RegisterEvent{
  final String name;
  final String email;
  final String password;

  RegisterButtonClicked({required this.name, required this.email, required this.password});
}

class AlreadyaUserClicked extends RegisterEvent{}