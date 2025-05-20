import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:clean_architecture_app/core/usecase/usecase.dart';
import 'package:clean_architecture_app/features/Auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserSignIn implements Usecase< User , UserSignInParams > {
  final AuthRepo authrepo;

  UserSignIn({required this.authrepo});
  
  @override
  Future<Either<Failures, User>> call(UserSignInParams params) async {
    return await authrepo.signInWithEmailPAss(email: params.email,
     password: params.password);
    

   
  }
  

}



class UserSignInParams {
  
  final String email ;
  final String password;

 UserSignInParams({
   required this.email, 
   required this.password});
}