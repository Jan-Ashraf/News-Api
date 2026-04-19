import 'package:flutter/material.dart';
import 'package:news_api/views/categoryList.dart';
import 'package:news_api/views/newsListView.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  late String cate = "general";
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: costumeRichText()
          ),
        body: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(child:costumeCategoryList(onCategoryChange: (String categoryName) {
              setState(() {
                cate = categoryName;
                cate.toLowerCase();
              });
            },),height: 120,),

            newsListView(category: cate,key: ValueKey(cate),),
          ],
        )
        ),
    );
  }
}


class costumeRichText extends StatelessWidget {
  const costumeRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "News",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          children: <TextSpan>[
            TextSpan(
                text: "Cloud",
                style: TextStyle(color: Colors.orange)
            )
          ],
        ),
      ),
    );
  }
}
