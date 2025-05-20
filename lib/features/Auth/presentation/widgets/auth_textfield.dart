import 'package:flutter/material.dart';

class AuthTextfield extends StatelessWidget {
  final String hinttext ;
  final bool isPassword  ;
  final TextEditingController mycontroller;
const AuthTextfield({ Key? key, 
required this.hinttext,
 required this.isPassword, 
 required this.mycontroller }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: mycontroller,
      obscureText: isPassword? true : false,
      decoration: InputDecoration(
        hintText: hinttext ,
        
      ),  
      validator: (value) {
        if(value!.isEmpty){
          return "$hinttext is missing!";

        }
        return null;
      } ,

    );
  }
}