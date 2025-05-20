import 'package:clean_architecture_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_app/core/secrets/app_secrets.dart';
import 'package:clean_architecture_app/features/Auth/data/datasources/auth_remotedbSource.dart';
import 'package:clean_architecture_app/features/Auth/data/repository/auth_repo_impl.dart';
import 'package:clean_architecture_app/features/Auth/domain/repository/auth_repo.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/current_user.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/userSignIn.dart';
import 'package:clean_architecture_app/features/Auth/domain/usecases/userSignup.dart';
import 'package:clean_architecture_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> _initCubit() async {
   print("ServiceLocator: CREATING SINGLETON AppUserCubit instance");
  serviceLocator.registerLazySingleton(() => AppUserCubit() );

}
Future<void> initdependecies() async {
  _initCubit();
  _initAuth();

  final supabase = await Supabase.initialize(
    url: AppSecrets.supberbaseUrl,
    anonKey: AppSecrets.superbaseKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemotedbsource>(
    () => AuthRemotedbsourceImpl(supabaseClient: serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepo>(
    () => AuthRepoImpl(remotedatasource: serviceLocator()),
  );

  serviceLocator.registerFactory(() => UserSignUp(authrepo: serviceLocator()));
  serviceLocator.registerFactory(() => UserSignIn(authrepo : serviceLocator()));
  serviceLocator.registerFactory(() => CurrentUser(authRepo: serviceLocator()));

  

  serviceLocator.registerLazySingleton(
    () => AuthBloc(userSignUp: serviceLocator() ,
     userSignIn : serviceLocator() , current: serviceLocator() , 
     appUserCubit: serviceLocator() ),
  );
}
 