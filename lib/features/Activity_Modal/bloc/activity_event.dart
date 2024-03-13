part of 'activity_bloc.dart';

@immutable
sealed class ActivityEvent {}

class AddActivityItemButtonClicked extends ActivityEvent{
  final AddActivity item;
  AddActivityItemButtonClicked({required this.item});
}