import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imageselectorconatiner() {
  return DottedBorder(
    options: const RoundedRectDottedBorderOptions(
      color: AppPallete.borderColor,
      dashPattern: [10, 4],
      radius: Radius.circular(10),
      strokeCap: StrokeCap.round,
    ),

    child: Container(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Icon(Icons.folder_open_rounded, size: 40),
          SizedBox(height: 20),
          Text("Select your Image", style: GoogleFonts.poppins(fontSize: 16)),
          Spacer(),
        ],
      ),
    ),
  );
}