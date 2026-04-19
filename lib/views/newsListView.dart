import 'package:dio/src/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_api/services/news_services.dart';
import 'package:news_api/widgets/costumeContainerNews.dart';

import '../models/news_model.dart';

class newsListView extends StatefulWidget {
  const newsListView({super.key, required this.category});

  final String category;

  @override
  State<newsListView> createState() => _newsListViewState();
}

class _newsListViewState extends State<newsListView> {
  late Future<List<ArticleModel>> futureArticles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureArticles = NewsService(Dio()).getTopHeadlines(category: widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }


        List<ArticleModel> artical = snapshot.data!;


        return Expanded(
          child: ListView.builder(
            itemCount: artical.length,
            itemBuilder: (context, index) {
              return costumeContainerNews(title: artical[index].title, description: artical[index].description, image: artical[index].image);
            },
          ),
        );
      },
    );
  }
}
