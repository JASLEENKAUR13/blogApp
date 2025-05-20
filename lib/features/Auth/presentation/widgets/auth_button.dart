import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String buttonText ;
  final VoidCallback onpressed ;
const AuthButton({ Key? key, required this.buttonText, 
required this.onpressed ,  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors:[AppPallete.gradient1 , 
        AppPallete.gradient2] , 
        begin: Alignment.bottomLeft ,
        end: Alignment.topRight),

      ),
      child: ElevatedButton(onPressed:  onpressed,
      style: ElevatedButton.styleFrom(
        fixedSize:  const Size(395, 55) ,
        backgroundColor: AppPallete.transparentColor,
        shadowColor: AppPallete.transparentColor,

      
      ),
      child: Text(buttonText , style: GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w600 , 
        
      ), ), 
      ),
    );
  }
}