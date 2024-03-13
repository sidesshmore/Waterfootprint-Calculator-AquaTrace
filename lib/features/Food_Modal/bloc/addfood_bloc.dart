import 'dart:async';
import 'dart:developer';

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
    print(event.item.itemName);
    print(event.item.quantity);
    print(event.item.category);
  }
}
