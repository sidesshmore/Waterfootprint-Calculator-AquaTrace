part of 'activity_bloc.dart';

@immutable
sealed class ActivityState {}

abstract class ActivityActionState extends ActivityState{}

final class ActivityInitial extends ActivityState {}

final class ActivityAdded extends ActivityActionState{}

