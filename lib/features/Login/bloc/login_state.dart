part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

abstract class LoginActionState extends LoginState{} 

final class LoginInitial extends LoginState {}

class NavigateToDashboard extends LoginActionState{}

class NavigateToRegister extends LoginActionState{}

class NavigateToErrorState extends LoginActionState{}