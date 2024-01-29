import 'dart:async';

import 'package:aqua_trace/features/Register/repo/register_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    
    on<RegisterButtonClicked>(registerButtonClicked);
    on<AlreadyaUserClicked>(alreadyaUserClicked);

  }

  FutureOr<void> registerButtonClicked(RegisterButtonClicked event, Emitter<RegisterState> emit) async{
    User? user=await RegisterRepo.register(event.name, event.email, event.password);
    if(user==null){
      emit(NavigateToErrorState());
    }
    else{
      emit(NavigateToDashboard());
    }
  }

  FutureOr<void> alreadyaUserClicked(AlreadyaUserClicked event, Emitter<RegisterState> emit) {
    emit(NavigateToLogin());
  }
}
