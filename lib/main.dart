import 'package:clean_architecture_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:clean_architecture_app/core/theme/theme.dart';

import 'package:clean_architecture_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_app/features/Auth/presentation/pages/signIn_page.dart';
import 'package:clean_architecture_app/features/blog/presentation/pages/blog_page.dart';
import 'package:clean_architecture_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initdependecies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
        BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(); // Fixed: Matches State<MyApp>
}

class _MyAppState extends State<MyApp> {
  // Fixed: Properly linked to MyApp
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthISUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My blog",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
           if (state is AuthLoading) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator(key: ValueKey("auth_loading"))));
          }
          if (state is AuthInitial) {
             return const Scaffold(
                body: Center(child: CircularProgressIndicator(key: ValueKey("auth_initial_loading"))));
          }

          return BlocSelector<AppUserCubit, AppUserState, bool>(
            selector: (state) {
              return state is AppUserLoggedIn;
            },
            builder: (context, state) {


              print("MyApp BlocSelector: BUILDER CALLED. isLoggedIn: $state");

             if(state){
                return BlogPage();

             }else{return const SignInPage();}
             
              
            },
          );
        },
      ),
    );
  }
}
