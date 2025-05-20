import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static  _myborder( [Color mycolor =AppPallete.borderColor ]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10) , 
        borderSide: BorderSide(
          color: mycolor , 
          width: 3

        )
        
      ) ;

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor ,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor ),
    inputDecorationTheme: InputDecorationTheme(
      
      contentPadding: const EdgeInsets.all(20),
      enabledBorder: _myborder(),
      focusedBorder: _myborder(AppPallete.gradient2),
    ),
    chipTheme: ChipThemeData(
      color: WidgetStatePropertyAll(
        AppPallete.backgroundColor

      )
    )

  );
}