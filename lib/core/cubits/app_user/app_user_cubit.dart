import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:flutter/material.dart';



part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial()){
     print("AppUserCubit (${this.hashCode}) CREATED");

  }
 
  void updateUser(User? user){
    if(user == null){
        print("AppUserCubit (${this.hashCode}): updateUser CALLED with NULL. Emitting AppUserInitial.");
      emit(AppUserInitial());
    }else{
       print("AppUserCubit (${this.hashCode}): updateUser CALLED with User: ${user.email}. Emitting AppUserLoggedIn.");
      emit(AppUserLoggedIn(user: user));
    }
  }
}
