import 'package:clean_architecture_app/core/error/exceptions.dart';
import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/Auth/data/datasources/auth_remotedbSource.dart';

import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:clean_architecture_app/features/Auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;
//import 'package:gotrue/src/types/user.dart' ;

class AuthRepoImpl implements AuthRepo {
  final AuthRemotedbsource remotedatasource;
  AuthRepoImpl({required this.remotedatasource});

  @override
  Future<Either<Failures, User>> signInWithEmailPAss({
    required String email,
    required String password,
  }) async {
    return _getUSer(() async => await remotedatasource
    .signInWithEmailPAss(email: email,
     password: password)  );
  }



  @override
  Future<Either<Failures, User>> signUpWithEmailPAss({
    required String name,
    required String email,
    required String password,
  }) async {

    return  _getUSer(() async =>  
    
       await remotedatasource.signUpWithEmailPAss(
        name: name,
        email: email,
        password: password,
      )
    );

      
    
  }


  Future<Either<Failures,User>> _getUSer(
    Future<User> Function() fn
  ) async{

    try{
      final user = await fn();
      return right(user);

    }on sb.AuthException catch (e){
      return left(Failures(message: e.message));
    }
    on ServerExceptions catch (e) {
      return left(Failures(message: e.message));
    }

  }
  
  @override
  Future<Either<Failures, User>> currentUser() async {

    try{
      final user = await remotedatasource.getCurrentUserdata();
      if(user == null){
        return left(Failures(message: 'User not logged In'));

      }
      
     return right(user);

    }on ServerExceptions catch(e){
      return left(Failures(message: e.message));

    }
    

  
    
  }
}
