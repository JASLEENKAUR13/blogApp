
import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/core/usecase/usecase.dart';

import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:clean_architecture_app/features/Auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';



class UserSignUp  implements Usecase<User , UsersignupParams>  {
  final AuthRepo authrepo ;

  const UserSignUp({required this.authrepo});

  
  @override
  Future<Either<Failures, User>> call(UsersignupParams params) 
   async {

    return await authrepo.signUpWithEmailPAss(name: params.name, 
    email: params.email,
     password: params.password);
    

    
    
   
   } 
   
}

class UsersignupParams {
  final String name ;
  final String email ;
  final String password;

  UsersignupParams({required this.name,
   required this.email, 
   required this.password});
}




