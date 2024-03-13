part of 'addfood_bloc.dart';

@immutable
sealed class AddfoodEvent {}

class closeModalSelected extends AddfoodEvent{}

class AddFoodItemButtonClicked extends AddfoodEvent{
  final AddFood item;
  AddFoodItemButtonClicked({required this.item});
}