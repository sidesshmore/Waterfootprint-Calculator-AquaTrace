import 'dart:async';

import 'package:aqua_trace/features/Login/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SignUpButtonClicked>(signUpButtonClicked);
    on<NewHereClicked>(newHereClicked);
  }
  
  

  FutureOr<void> signUpButtonClicked(SignUpButtonClicked event, Emitter<LoginState> emit) async{
    User? user=await LoginRepo.login(event.email, event.password);
    if(user==null){
      emit(NavigateToErrorState());
    }else{
      emit(NavigateToDashboard());
    }
  }

  FutureOr<void> newHereClicked(NewHereClicked event, Emitter<LoginState> emit) {
    emit(NavigateToRegister());
  }
}
