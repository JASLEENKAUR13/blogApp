import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget categoryRow(var list) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length
            ,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Chip(
                  label: Text(list[index]
                  ) , 
                side: BorderSide(
                  color : AppPallete.borderColor
                ),
                 
                  ),
              ); 
            },
          ),
        ),
      ),
    ],
  );
}
