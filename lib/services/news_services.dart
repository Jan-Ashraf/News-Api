import '../models/news_model.dart';
import 'package:dio/dio.dart';


class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?apiKey=d8af90585e0e41d2bf22152a979d9d0d&category=$category',
      );
      print("response status code: ${response.statusCode}");
      print(
        "response data: ${response.data}",
      );

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        articlesList.add(ArticleModel.fromJson(article));
      }

      return articlesList;
    } catch (e) {
      print(
        "error: $e",
      );
      return [];
    }
  }
}