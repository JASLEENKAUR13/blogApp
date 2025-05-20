import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/current_user.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/userSignIn.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/userSignup.dart';
import 'package:flutter/material.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp ; // usecase's object
  final UserSignIn _userSignIn;

  final CurrentUser _currentuser;
  final AppUserCubit _appUserCubit;
  
  AuthBloc( { required  CurrentUser current,
  required UserSignUp userSignUp , 
  required UserSignIn userSignIn , required  AppUserCubit   appUserCubit}) 
  : _userSignUp = userSignUp ,
  _userSignIn = userSignIn,
  _currentuser = current,
  _appUserCubit = appUserCubit,
   super(AuthInitial()) {
    on<AuthEvent>((_,emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSIgnIn);
    on< AuthISUserLoggedIn>( _authISUserLoggedIn );
    
    

  }

  Future<void> _onAuthSignUp( AuthSignUp event,  Emitter<AuthState>emit) async {
     // emit(AuthLoading());
       
       final res = await _userSignUp
       .call(UsersignupParams(name: event.name, 
       email: event.email, 
       password: event.password)
       );

       res.fold((l) => emit(AuthFailure(message: l.message)) ,
        (r) => _emitAuthSuccess( r , emit));
    }

  

  Future<void> _onAuthSIgnIn(AuthSignIn event, Emitter<AuthState> emit)async  {
    //emit(AuthLoading());

    final res = await _userSignIn.call(
      UserSignInParams(email: event.email, 
    password: event.password)); 

    res.fold((l) => emit(AuthFailure(message: l.message)),
    (r) =>  _emitAuthSuccess( r , emit));
  }



  FutureOr<void> _authISUserLoggedIn(AuthISUserLoggedIn event,
   Emitter<AuthState> emit) async  {
   // emit(AuthLoading());
    final res = await  _currentuser.call(NoParams());
   
    res.fold((l) => emit( AuthFailure(message: l.message)),
     (r) 
     { print(r.email);
      _emitAuthSuccess( r , emit);});
  }

  void   _emitAuthSuccess(User user , 
  Emitter<AuthState> emit ){
    _appUserCubit.updateUser( user );
    emit(AuthSuccess(user: user));
  }


} 
 