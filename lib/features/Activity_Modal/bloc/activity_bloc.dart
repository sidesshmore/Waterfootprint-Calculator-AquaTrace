import 'dart:async';

import 'package:aqua_trace/features/Activity_Modal/repos/activity_repo.dart';
import 'package:aqua_trace/models/addItem.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityInitial()) {
    on<AddActivityItemButtonClicked>(addActivityItemButtonClicked);
  }

  FutureOr<void> addActivityItemButtonClicked(AddActivityItemButtonClicked event, Emitter<ActivityState> emit)async{
    print('add food item clicked');
    bool success=await ActivityRepo.addActivity(event.item);
    print(event.item.activityName);
    print(event.item.time);
    if(success){
      emit(ActivityAdded());
    }
  }
}
