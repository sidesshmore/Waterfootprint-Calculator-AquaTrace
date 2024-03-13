part of 'addfood_bloc.dart';

@immutable
sealed class AddfoodState {}

final class AddfoodInitial extends AddfoodState {}

abstract class AddfoodActionState extends AddfoodState{}


