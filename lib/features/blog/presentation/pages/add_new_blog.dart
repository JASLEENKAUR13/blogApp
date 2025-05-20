import 'package:clean_architecture_app/core/theme/app_pallete.dart';
import 'package:clean_architecture_app/features/blog/presentation/widgets/categoryRow.dart';
import 'package:clean_architecture_app/features/blog/presentation/widgets/imageselectorWid.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddNewBlogPage());

  const AddNewBlogPage({Key? key}) : super(key: key);

  @override
  _AddNewBlogState createState() => _AddNewBlogState();
}

class _AddNewBlogState extends State<AddNewBlogPage> {
  final mylist = ['Technology ', 'Bussiness', 'Programming', 'Entertainment' , 'fashion' , 'food'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add New Blog", style: GoogleFonts.poppins(fontSize: 20)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.done_rounded))],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Spacer(), 
         
          imageselectorconatiner(),
          SizedBox(height: 15),
          categoryRow(mylist),
           SizedBox(height: 15),
           TextFormField(),

          
          Spacer()
          ]
          ),
      ),
    );
  }
}



