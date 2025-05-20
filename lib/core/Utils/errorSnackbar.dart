
import 'package:flutter/material.dart';

void  customizeshowSnackbar( 
  BuildContext context , String message
){
 ScaffoldMessenger.of(context)..hideCurrentSnackBar()
  ..showSnackBar(SnackBar(content:  Text(message) , 
  behavior: SnackBarBehavior.floating,
  duration: const Duration(seconds : 2), ));

}