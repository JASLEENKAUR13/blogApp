import 'package:clean_architecture_app/core/error/exceptions.dart';
import 'package:clean_architecture_app/features/Auth/data/models/user_models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemotedbsource {
  Session? get currentSession;

  Future<UserModels> signUpWithEmailPAss({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModels> signInWithEmailPAss({
    required String email,
    required String password,
  });
  Future<UserModels?> getCurrentUserdata();
}

class AuthRemotedbsourceImpl implements AuthRemotedbsource {
  final SupabaseClient supabaseClient;
  AuthRemotedbsourceImpl({required this.supabaseClient});

  @override
  Session? get currentSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModels> signInWithEmailPAss({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerExceptions(message: 'User is null');
      }

      return UserModels.fromJson(response.user!.toJson());
      
    } catch (e) {
      throw ServerExceptions(message: e.toString());
    }
  }

  @override
  Future<UserModels> signUpWithEmailPAss({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {"name": name},
      );

      if (response.user == null) {
        throw ServerExceptions(message: 'User is null');
      }

      return UserModels.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerExceptions(message: e.toString());
    }
  }

  @override
  Future<UserModels?> getCurrentUserdata() async {
    try {
      if (currentSession != null) {
        final userdata = await supabaseClient
            .from('profiles')
            .select() 
            .eq('id', currentSession!.user.id);
        return UserModels.fromJson(userdata.first ).copyWith(
          email : currentSession!.user.email
        );
      }
      return null;
    } catch (e) {
      throw ServerExceptions(message: e.toString());
    }
  }
}
