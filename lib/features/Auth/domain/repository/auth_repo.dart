import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/Auth/data/models/user_models.dart';
import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:fpdart/fpdart.dart';




abstract interface class AuthRepo {
  Future<Either<Failures, User>> signUpWithEmailPAss({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failures,User>> signInWithEmailPAss({
    required String email,
    required String password,
  });

  Future<Either<Failures,User>> currentUser ();
 

}







