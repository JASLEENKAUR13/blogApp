import 'package:clean_architecture_app/core/Utils/errorSnackbar.dart';
import 'package:clean_architecture_app/core/common/widgets/loader.dart';
import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:clean_architecture_app/features/Auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_app/features/Auth/presentation/pages/signIn_page.dart';
import 'package:clean_architecture_app/features/Auth/presentation/widgets/auth_button.dart';
import 'package:clean_architecture_app/features/Auth/presentation/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              customizeshowSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Sign Up.",
                    style: GoogleFonts.poppins(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthTextfield(
                    hinttext: "Name",
                    isPassword: false,
                    mycontroller: namecontroller,
                  ),
                  const SizedBox(height: 15),
                  AuthTextfield(
                    hinttext: "Email",
                    isPassword: false,
                    mycontroller: emailcontroller,
                  ),
                  const SizedBox(height: 15),
                  AuthTextfield(
                    hinttext: "Password",
                    isPassword: true,
                    mycontroller: passcontroller,
                  ),
                  const SizedBox(height: 25),
                  AuthButton(
                    buttonText: "Sign Up",
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          AuthSignUp(
                            name: namecontroller.text.trim(),
                            email: emailcontroller.text.trim(),
                            password: passcontroller.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignInPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppPallete.gradient2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}