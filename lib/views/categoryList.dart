import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/widgets/costumeContainerCategory.dart';

class costumeCategoryList extends StatelessWidget {
  const costumeCategoryList({super.key, required this.onCategoryChange});
  final Function(String) onCategoryChange;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        costumeContainerCategory(imageCate: "business.jpg",nameCate: "Business", onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "entertainment.jpg",nameCate: "Entertainment", onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "health.jpg",nameCate: "Health", onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "science.jpg",nameCate: "Science",onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "sports.jpg",nameCate: "Sports",onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "general.jpg",nameCate: "General",onTap: onCategoryChange,),
        costumeContainerCategory(imageCate: "technology.jpeg",nameCate: "Technology",onTap: onCategoryChange,),
      ],


    );
  }
}
