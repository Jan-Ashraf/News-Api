import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class costumeContainerNews extends StatelessWidget {
  const costumeContainerNews({super.key, required this.title, required this.description, required this.image});

  final String ?title;
  final String ?description;
  final String ?image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Ink.image(image: AssetImage('assets/images/sports.jpg')),
          if(image == null || image!.isEmpty)
             Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Center(child: Text('No Image Provided')),
            )else
          Image.network(image!, height: 200,width: double.infinity,fit: BoxFit.cover,),
          SizedBox(height: 7.5,),
          Text("$title", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
          SizedBox(height: 7.5,),
          Text("$description", style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black54), ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
