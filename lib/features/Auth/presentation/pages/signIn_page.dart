import 'package:clean_architecture_app/core/Utils/errorSnackbar.dart';
import 'package:clean_architecture_app/core/common/widgets/loader.dart';
import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:clean_architecture_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_app/features/Auth/presentation/pages/signup_page.dart';
import 'package:clean_architecture_app/features/Auth/presentation/widgets/auth_button.dart';
import 'package:clean_architecture_app/features/Auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignInPage());
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Myemailcontroller = TextEditingController();

  final Mypasscontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    Myemailcontroller.dispose();

    Mypasscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
           if(state is AuthFailure){
            customizeshowSnackbar(context, state.message);
           }
        
          },
          builder: (context, state) {

            if(state is AuthLoading){
              Loader();
            }
            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Spacer(),
                  Text(
                    "Sign In.",
                    style: GoogleFonts.poppins(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 30),

                  AuthTextfield(
                    hinttext: "Email",
                    isPassword: false,
                    mycontroller: Myemailcontroller,
                  ),
                  const SizedBox(height: 15),
                  AuthTextfield(
                    hinttext: "Password",
                    isPassword: true,
                    mycontroller: Mypasscontroller,
                  ),
                  const SizedBox(height: 25),
                  AuthButton(
                    buttonText: "Sign In ",
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          AuthSignIn(
                            email: Myemailcontroller.text.trim(),
                            password: Mypasscontroller.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignupPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: AppPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
