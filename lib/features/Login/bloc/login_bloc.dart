import 'dart:async';
import 'dart:developer';

import 'package:aqua_trace/features/Login/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SignUpButtonClicked>(signUpButtonClicked);
    on<NewHereClicked>(newHereClicked);
  }
  
  

  FutureOr<void> signUpButtonClicked(SignUpButtonClicked event, Emitter<LoginState> emit) async{
    User? user=await LoginRepo.login(event.email, event.password);
    log(user.toString());
    // Instance of Local Storage 
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(user==null){
      emit(NavigateToErrorState());
    }else{
      await prefs.setString('uid',user.uid);
     
      emit(NavigateToDashboard());
    }
  }

  FutureOr<void> newHereClicked(NewHereClicked event, Emitter<LoginState> emit) {
    emit(NavigateToRegister());
  }
}
