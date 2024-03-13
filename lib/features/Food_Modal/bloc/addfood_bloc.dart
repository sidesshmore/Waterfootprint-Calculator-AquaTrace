import 'dart:async';
import 'dart:developer';

import 'package:aqua_trace/features/Food_Modal/repos/food_repo.dart';
import 'package:aqua_trace/models/addItem.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addfood_event.dart';
part 'addfood_state.dart';

class AddfoodBloc extends Bloc<AddfoodEvent, AddfoodState> {
  AddfoodBloc() : super(AddfoodInitial()) {
    on<AddFoodItemButtonClicked>(addFoodItemButtonClicked);
  }

  FutureOr<void> addFoodItemButtonClicked(AddFoodItemButtonClicked event, Emitter<AddfoodState> emit) {
    print('add food item clicked');
    Food_Repo.addActivity(event.item);
  }
}
