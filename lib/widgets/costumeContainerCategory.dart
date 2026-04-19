import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class costumeContainerCategory extends StatelessWidget {
  const costumeContainerCategory({super.key, required this.imageCate, required this.nameCate, required this.onTap});

  final String imageCate;
  final String nameCate;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(nameCate);
        print(nameCate);

      },
      child: Container(
        height: 200,
        width: 200,
        margin: EdgeInsetsGeometry.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(image:AssetImage('assets/images/$imageCate'),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12),
        ),
        
        child: Center(child: Text(nameCate, style: TextStyle(color: CupertinoColors.white, fontSize: 25, fontWeight: FontWeight.bold),))
      ),
    );
  }
}
