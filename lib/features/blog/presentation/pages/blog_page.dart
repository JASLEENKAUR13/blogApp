import 'package:clean_architecture_app/features/blog/presentation/pages/add_new_blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPage extends StatelessWidget {
const BlogPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog App" , style: GoogleFonts.poppins(fontSize: 20),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, AddNewBlogPage.route() );
           
          },
           icon: const Icon(CupertinoIcons.add_circled))
        ],
      ),
    );
  }
}