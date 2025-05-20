import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/core/usecase/usecase.dart';
import 'package:clean_architecture_app/core/entities/user.dart';
import 'package:clean_architecture_app/features/Auth/domain/repository/auth_repo.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser  implements Usecase<User , NoParams>{
  final AuthRepo authRepo;

  CurrentUser({required this.authRepo});
  @override
  Future<Either<Failures, User>> call(NoParams params) async  {
    return await authRepo.currentUser();
   
  }
  
}

class NoParams {
  
}