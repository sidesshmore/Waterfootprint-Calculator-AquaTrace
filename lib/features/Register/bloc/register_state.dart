part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

abstract class RegisterActionState extends RegisterState{}

final class RegisterInitial extends RegisterState {}

class NavigateToLogin extends RegisterActionState{}

class NavigateToDashboard extends RegisterActionState{}

class NavigateToErrorState extends RegisterActionState{}

